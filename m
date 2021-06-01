Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A8397A87
	for <lists+nouveau@lfdr.de>; Tue,  1 Jun 2021 21:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1364489FF7;
	Tue,  1 Jun 2021 19:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE71A89FC9;
 Tue,  1 Jun 2021 19:13:33 +0000 (UTC)
IronPort-SDR: KotutrrtKP/BHdt7tVLJt66zqxfUuuL8OfL+ZL9MI04WZraFgHgXZWISMxFM+5wsv0cBOTpHAh
 0s5gCia1O2lA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203427598"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="203427598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 12:13:33 -0700
IronPort-SDR: XZfNggu8LPnDflnn0SwdD0eW5QHn16G+JHMjSIbx7gJ4GsbhykrcMm1S7EKLBBD58pMxnt1b90
 9m7iHrvHCi2g==
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="479405172"
Received: from ycohenha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.130])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 12:13:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <YKgSJ+0YtLYQnOQB@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210514181504.565252-1-lyude@redhat.com>
 <20210514181504.565252-2-lyude@redhat.com> <YKgSJ+0YtLYQnOQB@intel.com>
Date: Tue, 01 Jun 2021 22:13:25 +0300
Message-ID: <87wnrdpfe2.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH v6 1/9] drm/i915/dpcd_bl: Remove redundant AUX
 backlight frequency calculations
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Rajeev Nandan <rajeevny@codeaurora.org>, greg.depoire@gmail.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 21 May 2021, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, May 14, 2021 at 02:14:55PM -0400, Lyude Paul wrote:
>> Noticed this while moving all of the VESA backlight code in i915 over to
>> DRM helpers: it would appear that we calculate the frequency value we want
>> to write to DP_EDP_BACKLIGHT_FREQ_SET twice even though this value never
>> actually changes during runtime. So, let's simplify things by just caching
>> this value in intel_panel.backlight, and re-writing it as-needed.
>> 
>> Changes since v1:
>> * Wrap panel->backlight.edp.vesa.pwm_freq_pre_divider in
>>   DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP check - Jani
>
> This looks okay to me now... Jani, agree?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>> 
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: greg.depoire@gmail.com
>> ---
>>  .../drm/i915/display/intel_display_types.h    |  1 +
>>  .../drm/i915/display/intel_dp_aux_backlight.c | 65 ++++++-------------
>>  2 files changed, 20 insertions(+), 46 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 9c0adfc60c6f..7054a37363fb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -311,6 +311,7 @@ struct intel_panel {
>>  		union {
>>  			struct {
>>  				u8 pwmgen_bit_count;
>> +				u8 pwm_freq_pre_divider;
>>  			} vesa;
>>  			struct {
>>  				bool sdr_uses_aux;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> index 8e9ac9ba1d38..68bfe50ada59 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> @@ -373,50 +373,6 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
>>  	}
>>  }
>>  
>> -/*
>> - * Set PWM Frequency divider to match desired frequency in vbt.
>> - * The PWM Frequency is calculated as 27Mhz / (F x P).
>> - * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
>> - *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
>> - * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
>> - *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
>> - */
>> -static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
>> -{
>> -	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
>> -	const u8 pn = connector->panel.backlight.edp.vesa.pwmgen_bit_count;
>> -	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
>> -
>> -	freq = dev_priv->vbt.backlight.pwm_freq_hz;
>> -	if (!freq) {
>> -		drm_dbg_kms(&dev_priv->drm,
>> -			    "Use panel default backlight frequency\n");
>> -		return false;
>> -	}
>> -
>> -	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
>> -	f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
>> -	fxp_actual = f << pn;
>> -
>> -	/* Ensure frequency is within 25% of desired value */
>> -	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>> -	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
>> -
>> -	if (fxp_min > fxp_actual || fxp_actual > fxp_max) {
>> -		drm_dbg_kms(&dev_priv->drm, "Actual frequency out of range\n");
>> -		return false;
>> -	}
>> -
>> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>> -			       DP_EDP_BACKLIGHT_FREQ_SET, (u8) f) < 0) {
>> -		drm_dbg_kms(&dev_priv->drm,
>> -			    "Failed to write aux backlight freq\n");
>> -		return false;
>> -	}
>> -	return true;
>> -}
>> -
>>  static void
>>  intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>>  				   const struct drm_connector_state *conn_state, u32 level)
>> @@ -459,9 +415,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>>  		break;
>>  	}
>>  
>> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
>> -		if (intel_dp_aux_vesa_set_pwm_freq(connector))
>> +	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
>> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
>> +				       panel->backlight.edp.vesa.pwm_freq_pre_divider) == 1)
>>  			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
>> +		else
>> +			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency\n");
>> +	}
>>  
>>  	if (new_dpcd_buf != dpcd_buf) {
>>  		if (drm_dp_dpcd_writeb(&intel_dp->aux,
>> @@ -482,6 +442,14 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
>>  				  false);
>>  }
>>  
>> +/*
>> + * Compute PWM frequency divider value based off the frequency provided to us by the vbt.
>> + * The PWM Frequency is calculated as 27Mhz / (F x P).
>> + * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
>> + *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
>> + * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
>> + *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
>> + */
>>  static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
>>  {
>>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>> @@ -533,8 +501,10 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>>  	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>  	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>  
>> +	/* Ensure frequency is within 25% of desired value */
>>  	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>>  	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
>> +
>>  	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
>>  		drm_dbg_kms(&i915->drm,
>>  			    "VBT defined backlight frequency out of range\n");
>> @@ -555,7 +525,10 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>>  			    "Failed to write aux pwmgen bit count\n");
>>  		return max_backlight;
>>  	}
>> +
>>  	panel->backlight.edp.vesa.pwmgen_bit_count = pn;
>> +	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
>> +		panel->backlight.edp.vesa.pwm_freq_pre_divider = f;
>>  
>>  	max_backlight = (1 << pn) - 1;
>>  
>> -- 
>> 2.31.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
