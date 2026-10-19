    // 将原始数据裁剪为8位输出数据。
    function [7:0] clip_shift_u8;
        input [15:0] value;
        reg [15:0] shifted;
    begin
        shifted = value >> STAT_SHIFT;  // Apply the configured right shift (normally 4).
        if (shifted[15:8] != 0) begin   // Nonzero upper bits indicate that saturation clipping is required.
            clip_shift_u8 = 8'hff;      // Saturate to 255.
        end else begin                  // Otherwise keep the low eight bits.
            clip_shift_u8 = shifted[7:0]; // Low eight bits.
        end
    end
    endfunction

        //钳位函数
    function [15:0] clamp_gain_q12;
        input [31:0] value;
    begin
        if (value < 32'd2048) begin
            clamp_gain_q12 = 16'd2048;
        end else if (value > 32'd12288) begin
            clamp_gain_q12 = 16'd12288;
        end else begin
            clamp_gain_q12 = value[15:0];
        end
    end
    endfunction

    //置信度等级
    function [1:0] conf_from_ratio;
        input [31:0] count;
        input [31:0] total;
        input [9:0] strong_per_mille;
        input [9:0] med_per_mille;
        input [9:0] weak_per_mille;
        reg [47:0] scaled;
    begin
        if (total == 0) begin
            conf_from_ratio = 2'd0;
        end else begin
            scaled = count * 1000;
            if (scaled > (total * strong_per_mille)) begin
                conf_from_ratio = 2'd3;
            end else if (scaled > (total * med_per_mille)) begin
                conf_from_ratio = 2'd2;
            end else if (scaled > (total * weak_per_mille)) begin
                conf_from_ratio = 2'd1;
            end else begin
                conf_from_ratio = 2'd0;
            end
        end
    end
    endfunction

    //置信度降级
    function [1:0] dec_conf;
        input [1:0] conf;
    begin
        dec_conf = (conf == 0) ? 0 : (conf - 1'b1);
    end
    endfunction

    //绝对差值计算（8位）
    function [7:0] abs_diff8;
        input [7:0] a;
        input [7:0] b;
    begin
        abs_diff8 = (a >= b) ? (a - b) : (b - a);
    end
    endfunction

    //绝对差值计算（16位）
    function [15:0] abs_diff16;
        input [15:0] a;
        input [15:0] b;
    begin
        abs_diff16 = (a >= b) ? (a - b) : (b - a);
    end
    endfunction
/*--------------------------------------------------------------------------
    //一阶IIR滤波器
    function [15:0] iir_step_q12;
        input [15:0] prev;
        input [15:0] est;
        input [3:0]  beta_shift;
        reg signed [16:0] delta;
        reg signed [16:0] accum;
    begin
        delta = $signed({1'b0, est}) - $signed({1'b0, prev});
        accum = $signed({1'b0, prev}) + (delta >>> beta_shift);
        if (accum < 0) begin
            iir_step_q12 = 16'd0;
        end else begin
            iir_step_q12 = accum[15:0];
        end
    end
    endfunction
------------------------------------------------------------------------------*/
    //一阶IIR滤波器,在这个算法中，iir_step_q12<max(prev,est)，返回结果设为16位即可
    function [15:0] iir_step_q12;
        input [15:0] prev;
        input [15:0] est;
        input [3:0]  beta_shift;
        reg  [15:0] diff;
        reg  [15:0] step;
    begin
            diff = (est >= prev) ? (est - prev) : (prev - est);
            step = diff >> beta_shift;
            iir_step_q12 = (est >= prev) ? (prev + step): ((prev > step) ? (prev - step) : 16'd0);
    end
    endfunction