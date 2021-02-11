Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC59318435
	for <lists+nouveau@lfdr.de>; Thu, 11 Feb 2021 05:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F66EDE7;
	Thu, 11 Feb 2021 04:15:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215926E3B7;
 Thu, 11 Feb 2021 04:15:44 +0000 (UTC)
IronPort-SDR: ySlkbmnA5XEe4yVuxHkCivdaO78FKcBIFkexhDQSIVGgot5w3NfqNN2Bv+hcQzWXOocla1fOtL
 +cjEl9vraGzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161941526"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="161941526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 20:15:43 -0800
IronPort-SDR: 0pxbHlCADCLWk3Laj89TqAiKs6pxnx0GUZUCmH0QKm4WPxNARUNi1cd5xwMt5AORCQDA6vTFm/
 kgfoTXiRJ8WQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="436956182"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 20:15:41 -0800
Date: Wed, 10 Feb 2021 23:15:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20210211041540.GI82362@intel.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-11-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208233902.1289693-11-lyude@redhat.com>
Subject: Re: [Nouveau] [Intel-gfx] [RFC v4 10/11] drm/dp: Extract i915's eDP
 backlight code into DRM helpers
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
Cc: greg.depoire@gmail.com, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 06:39:00PM -0500, Lyude Paul wrote:
> Since we're about to implement eDP backlight support in nouveau using the
> standard protocol from VESA, we might as well just take the code that's
> already written for this and move it into a set of shared DRM helpers.
> 
> Note that these helpers are intended to handle DPCD related backlight
> control bits such as setting the brightness level over AUX, probing the
> backlight's TCON, enabling/disabling the backlight over AUX if supported,
> etc. Any PWM-related portions of backlight control are explicitly left up
> to the driver, as these will vary from platform to platform.
> 
> The only exception to this is the calculation of the PWM frequency
> pre-divider value. This is because the only platform-specific information
> required for this is the PWM frequency of the panel, which the driver is
> expected to provide if available. The actual algorithm for calculating this
> value is standard and is defined in the eDP specification from VESA.
> 
> Note that these helpers do not yet implement the full range of features
> the VESA backlight interface provides, and only provide the following
> functionality (all of which was already present in i915's DPCD backlight
> support):
> 
> * Basic control of brightness levels
> * Basic probing of backlight capabilities
> * Helpers for enabling and disabling the backlight
> 
> v3:
> * Split out changes to i915's backlight code to separate patches to make it
>   easier to review
> v4:
> * Style/spelling changes from Thomas Zimmermann
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: greg.depoire@gmail.com
> ---
>  drivers/gpu/drm/drm_dp_helper.c               | 332 ++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |   5 +-
>  .../drm/i915/display/intel_dp_aux_backlight.c | 285 ++-------------
>  include/drm/drm_dp_helper.h                   |  48 +++
>  4 files changed, 412 insertions(+), 258 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index eedbb48815b7..1a3d4679d720 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -3082,3 +3082,335 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> +
> +/**
> + * drm_edp_backlight_set_level() - Set the backlight level of an eDP panel via AUX
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + * @level: The brightness level to set
> + *
> + * Sets the brightness level of an eDP panel's backlight. Note that the panel's backlight must
> + * already have been enabled by the driver by calling drm_edp_backlight_enable().
> + *
> + * Returns: %0 on success, negative error code on failure
> + */
> +int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> +				u16 level)
> +{
> +	int ret;
> +	u8 buf[2] = { 0 };
> +
> +	if (bl->lsb_reg_used) {
> +		buf[0] = (level & 0xff00) >> 8;
> +		buf[1] = (level & 0x00ff);
> +	} else {
> +		buf[0] = level;
> +	}
> +
> +	ret = drm_dp_dpcd_write(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		DRM_ERROR("%s: Failed to write aux backlight level: %d\n", aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_set_level);
> +
> +static int
> +drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> +			     bool enable)
> +{
> +	int ret;
> +	u8 buf;
> +
> +	/* The panel uses something other then DPCD for enabling its backlight */
> +	if (!bl->aux_enable)
> +		return 0;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf);
> +	if (ret != 1) {
> +		DRM_ERROR("%s: Failed to read eDP display control register: %d\n", aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +	if (enable)
> +		buf |= DP_EDP_BACKLIGHT_ENABLE;
> +	else
> +		buf &= ~DP_EDP_BACKLIGHT_ENABLE;
> +
> +	ret = drm_dp_dpcd_writeb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf);
> +	if (ret != 1) {
> +		DRM_ERROR("%s: Failed to write eDP display control register: %d\n", aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_edp_backlight_enable() - Enable an eDP panel's backlight using DPCD
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + * @level: The initial backlight level to set via AUX, if there is one
> + *
> + * This function handles enabling DPCD backlight controls on a panel over DPCD, while additionally
> + * restoring any important backlight state such as the given backlight level, the brightness byte
> + * count, backlight frequency, etc.
> + *
> + * Note that certain panels, while supporting brightness level controls over DPCD, may not support
> + * having their backlights enabled via the standard %DP_EDP_DISPLAY_CONTROL_REGISTER. On such panels
> + * &drm_edp_backlight_info.aux_enable will be set to %false, this function will skip the step of
> + * programming the %DP_EDP_DISPLAY_CONTROL_REGISTER, and the driver must perform the required
> + * implementation specific step for enabling the backlight after calling this function.
> + *
> + * Returns: %0 on success, negative error code on failure.
> + */
> +int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> +			     const u16 level)
> +{
> +	int ret;
> +	u8 dpcd_buf, new_dpcd_buf;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read backlight mode: %d\n", aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	new_dpcd_buf = dpcd_buf;
> +
> +	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
> +		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> +
> +		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
> +		if (ret != 1)
> +			DRM_DEBUG_KMS("%s: Failed to write aux pwmgen bit count: %d\n",
> +				      aux->name, ret);
> +	}
> +
> +	if (bl->pwm_freq_pre_divider) {
> +		ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_FREQ_SET, bl->pwm_freq_pre_divider);
> +		if (ret != 1)
> +			DRM_DEBUG_KMS("%s: Failed to write aux backlight frequency: %d\n",
> +				      aux->name, ret);
> +		else
> +			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
> +	}
> +
> +	if (new_dpcd_buf != dpcd_buf) {
> +		ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, new_dpcd_buf);
> +		if (ret != 1) {
> +			DRM_DEBUG_KMS("%s: Failed to write aux backlight mode: %d\n",
> +				      aux->name, ret);
> +			return ret < 0 ? ret : -EIO;
> +		}
> +	}
> +
> +	ret = drm_edp_backlight_set_level(aux, bl, level);
> +	if (ret < 0)
> +		return ret;
> +	ret = drm_edp_backlight_set_enable(aux, bl, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_enable);
> +
> +/**
> + * drm_edp_backlight_disable() - Disable an eDP backlight using DPCD, if supported
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + *
> + * This function handles disabling DPCD backlight controls on a panel over AUX. Note that some
> + * panels have backlights that are enabled/disabled by other means, despite having their brightness
> + * values controlled through DPCD. On such panels &drm_edp_backlight_info.aux_enable will be set to
> + * %false, this function will become a no-op (and we will skip updating
> + * %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must take care to perform it's own
> + * implementation specific step for disabling the backlight.
> + *
> + * Returns: %0 on success or no-op, negative error code on failure.
> + */
> +int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl)
> +{
> +	int ret;
> +
> +	ret = drm_edp_backlight_set_enable(aux, bl, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_disable);
> +
> +static inline int
> +drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
> +			    u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> +{
> +	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> +	int ret;
> +	u8 pn, pn_min, pn_max;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap: %d\n", aux->name, ret);
> +		return -ENODEV;
> +	}
> +
> +	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	bl->max = (1 << pn) - 1;
> +	if (!driver_pwm_freq_hz)
> +		return 0;
> +
> +	/*
> +	 * Set PWM Frequency divider to match desired frequency provided by the driver.
> +	 * The PWM Frequency is calculated as 27Mhz / (F x P).
> +	 * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
> +	 *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> +	 * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
> +	 *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> +	 */
> +
> +	/* Find desired value of (F x P)
> +	 * Note that, if F x P is out of supported range, the maximum value or minimum value will
> +	 * applied automatically. So no need to check that.
> +	 */
> +	fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> +
> +	/* Use highest possible value of Pn for more granularity of brightness adjustment while
> +	 * satifying the conditions below.
> +	 * - Pn is in the range of Pn_min and Pn_max
> +	 * - F is in the range of 1 and 255
> +	 * - FxP is within 25% of desired value.
> +	 *   Note: 25% is arbitrary value and may need some tweak.
> +	 */
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap min: %d\n", aux->name, ret);
> +		return 0;
> +	}
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap max: %d\n", aux->name, ret);
> +		return 0;
> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	/* Ensure frequency is within 25% of desired value */
> +	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> +	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> +	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> +		DRM_DEBUG_KMS("%s: Driver defined backlight frequency (%d) out of range\n",
> +			      aux->name, driver_pwm_freq_hz);
> +		return 0;
> +	}
> +
> +	for (pn = pn_max; pn >= pn_min; pn--) {
> +		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> +		fxp_actual = f << pn;
> +		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
> +			break;
> +	}
> +
> +	ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to write aux pwmgen bit count: %d\n", aux->name, ret);
> +		return 0;
> +	}
> +	bl->pwmgen_bit_count = pn;
> +	bl->max = (1 << pn) - 1;
> +
> +	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP) {
> +		bl->pwm_freq_pre_divider = f;
> +		DRM_DEBUG_KMS("%s: Using backlight frequency from driver (%dHz)\n",
> +			      aux->name, driver_pwm_freq_hz);
> +	}
> +
> +	return 0;
> +}
> +

thanks for the clean up...
up to this point it was easy to see the code added and code remove matches...

> +static inline int
> +drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
> +			      u8 *current_mode)
> +{
> +	int ret;
> +	u8 buf[2];
> +	u8 mode_reg;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
> +	if (ret != 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read backlight mode: %d\n", aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
> +	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {

However I'm afraid that on this area here we have something that could be
improved further...

> +		int size = 1 + bl->lsb_reg_used;
> +
> +		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
> +		if (ret != size) {
> +			DRM_DEBUG_KMS("%s: Failed to read backlight level: %d\n", aux->name, ret);

But probably the biggest blocker is the "regression" of the debug logs.
Not just in this point, but I mean everywhere...
the use of the old DRM_DEBUG_KMS should be avoided here imho.
Although it is backlight, what it would mean integrated and only
one device available, this will at least change how we see the logs..

Any change of using drm_dbg_*(drm, ?!

> +			return ret < 0 ? ret : -EIO;
> +		}
> +
> +		if (bl->lsb_reg_used)
> +			return (buf[0] << 8) | buf[1];
> +		else
> +			return buf[0];
> +	}
> +
> +	/*
> +	 * If we're not in DPCD control mode yet, the programmed brightness value is meaningless and
> +	 * the driver should assume max brightness
> +	 */
> +	return bl->max;
> +}
> +
> +/**
> + * drm_edp_backlight_init() - Probe a display panel's TCON using the standard VESA eDP backlight
> + * interface.
> + * @aux: The DP aux device to use for probing
> + * @bl: The &drm_edp_backlight_info struct to fill out with information on the backlight
> + * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
> + * @edp_dpcd: A cached copy of the eDP DPCD
> + * @current_level: Where to store the probed brightness level
> + * @current_mode: Where to store the currently set backlight control mode
> + *
> + * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
> + * along with also probing the current and maximum supported brightness levels.
> + *
> + * If @driver_pwm_freq_hz is non-zero, this will be used as the backlight frequency. Otherwise, the
> + * default frequency from the panel is used.
> + *
> + * Returns: %0 on success, negative error code on failure.
> + */
> +int
> +drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
> +		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> +		       u16 *current_level, u8 *current_mode)
> +{
> +	int ret;
> +
> +	if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> +		bl->aux_enable = true;
> +	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +		bl->lsb_reg_used = true;
> +
> +	ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = drm_edp_backlight_probe_level(aux, bl, current_mode);
> +	if (ret < 0)
> +		return ret;
> +	*current_level = ret;
> +
> +	DRM_DEBUG_KMS("%s: Found backlight level=%d/%d pwm_freq_pre_divider=%d mode=%x\n",
> +		      aux->name, *current_level, bl->max, bl->pwm_freq_pre_divider, *current_mode);
> +	DRM_DEBUG_KMS("%s: Backlight caps: pwmgen_bit_count=%d lsb_reg_used=%d aux_enable=%d\n",
> +		      aux->name, bl->pwmgen_bit_count, bl->lsb_reg_used, bl->aux_enable);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_init);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 1d8984077e8a..9f43d0b14e11 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -264,10 +264,7 @@ struct intel_panel {
>  		/* DPCD backlight */
>  		union {
>  			struct {
> -				u8 pwmgen_bit_count;
> -				u8 pwm_freq_pre_divider;
> -				bool lsb_reg_used;
> -				bool aux_enable;
> +				struct drm_edp_backlight_info info;
>  			} vesa;
>  			struct {
>  				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index a98d9bd4b0ed..286eb337448e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -270,114 +270,19 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
>  }
>  
>  /* VESA backlight callbacks */
> -static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connector *connector)
> -{
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	int ret;
> -	u8 mode_reg;
> -
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);
> -		return false;
> -	}
> -
> -	return (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) ==
> -	       DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> -}
> -
> -/*
> - * Read the current backlight value from DPCD register(s) based
> - * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
> - */
>  static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, enum pipe unused)
>  {
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	int ret;
> -	u8 read_val[2] = { 0x0 };
> -	u16 level = 0;
> -
> -	/*
> -	 * If we're not in DPCD control mode yet, the programmed brightness
> -	 * value is meaningless and we should assume max brightness
> -	 */
> -	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
> -		return connector->panel.backlight.max;
> -
> -	ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, &read_val,
> -			       sizeof(read_val));
> -	if (ret != sizeof(read_val)) {
> -		drm_dbg_kms(&i915->drm, "Failed to read brightness level: %d\n", ret);
> -		return 0;
> -	}
> -
> -	if (connector->panel.backlight.edp.vesa.lsb_reg_used)
> -		level = (read_val[0] << 8 | read_val[1]);
> -	else
> -		level = read_val[0];
> -
> -	return level;
> +	return connector->panel.backlight.level;
>  }
>  
> -/*
> - * Sends the current backlight level over the aux channel, checking if its using
> - * 8-bit or 16 bit value (MSB and LSB)
> - */
>  static void
> -intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
> -				u32 level)
> +intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u32 level)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	int ret;
> -	u8 vals[2] = { 0x0 };
> -
> -	/* Write the MSB and/or LSB */
> -	if (connector->panel.backlight.edp.vesa.lsb_reg_used) {
> -		vals[0] = (level & 0xFF00) >> 8;
> -		vals[1] = (level & 0xFF);
> -	} else {
> -		vals[0] = level;
> -	}
> -
> -	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
> -				sizeof(vals));
> -	if (ret != sizeof(vals)) {
> -		drm_dbg_kms(&i915->drm, "Failed to write aux backlight level: %d\n", ret);
> -		return;
> -	}
> -}
> -
> -static void set_vesa_backlight_enable(struct intel_connector *connector, bool enable)
> -{
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	int ret;
> -	u8 reg_val = 0;
> -
> -	/* Early return when display use other mechanism to enable backlight. */
> -	if (!connector->panel.backlight.edp.vesa.aux_enable)
> -		return;
> -
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read eDP display control register: %d\n", ret);
> -		return;
> -	}
> -
> -	if (enable)
> -		reg_val |= DP_EDP_BACKLIGHT_ENABLE;
> -	else
> -		reg_val &= ~(DP_EDP_BACKLIGHT_ENABLE);
> +	struct intel_panel *panel = &connector->panel;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> -	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, reg_val);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight: %d\n",
> -			    enable ? "enable" : "disable", ret);
> -	}
> +	drm_edp_backlight_set_level(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
>  }
>  
>  static void
> @@ -385,170 +290,46 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  				   const struct drm_connector_state *conn_state, u32 level)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_panel *panel = &connector->panel;
> -	int ret;
> -	u8 dpcd_buf, new_dpcd_buf;
> -	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
> -
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);
> -		return;
> -	}
> -
> -	new_dpcd_buf = dpcd_buf;
> -
> -	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> -		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
> -		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> -
> -		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pwmgen_bit_count);
> -		if (ret != 1)
> -			drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n", ret);
> -	}
> -
> -	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
> -		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
> -					 panel->backlight.edp.vesa.pwm_freq_pre_divider);
> -		if (ret == 1)
> -			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
> -		else
> -			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency: %d\n",
> -				    ret);
> -	}
> -
> -	if (new_dpcd_buf != dpcd_buf) {
> -		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> -					 new_dpcd_buf);
> -		if (ret != 1)
> -			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode: %d\n", ret);
> -	}
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> -	intel_dp_aux_vesa_set_backlight(conn_state, level);
> -	set_vesa_backlight_enable(connector, true);
> +	drm_edp_backlight_enable(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
>  }
>  
>  static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state,
>  						u32 level)
>  {
> -	set_vesa_backlight_enable(to_intel_connector(old_conn_state->connector), false);
> -}
> -
> -/*
> - * Compute PWM frequency divider value based off the frequency provided to us by the vbt.
> - * The PWM Frequency is calculated as 27Mhz / (F x P).
> - * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
> - *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> - * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
> - *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> - */
> -static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
> -{
> -	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
> -	u32 max_backlight = 0;
> -	int ret, freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> -	u8 pn, pn_min, pn_max;
> -
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap: %d\n", ret);
> -		return 0;
> -	}
> -
> -	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	max_backlight = (1 << pn) - 1;
> -
> -	/* Find desired value of (F x P)
> -	 * Note that, if F x P is out of supported range, the maximum value or
> -	 * minimum value will applied automatically. So no need to check that.
> -	 */
> -	freq = i915->vbt.backlight.pwm_freq_hz;
> -	drm_dbg_kms(&i915->drm, "VBT defined backlight frequency %u Hz\n",
> -		    freq);
> -	if (!freq) {
> -		drm_dbg_kms(&i915->drm,
> -			    "Use panel default backlight frequency\n");
> -		return max_backlight;
> -	}
> -
> -	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
> -
> -	/* Use highest possible value of Pn for more granularity of brightness
> -	 * adjustment while satifying the conditions below.
> -	 * - Pn is in the range of Pn_min and Pn_max
> -	 * - F is in the range of 1 and 255
> -	 * - FxP is within 25% of desired value.
> -	 *   Note: 25% is arbitrary value and may need some tweak.
> -	 */
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap min: %d\n", ret);
> -		return max_backlight;
> -	}
> -	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap max: %d\n", ret);
> -		return max_backlight;
> -	}
> -	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
> -	/* Ensure frequency is within 25% of desired value */
> -	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> -	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> -
> -	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> -		drm_dbg_kms(&i915->drm,
> -			    "VBT defined backlight frequency out of range\n");
> -		return max_backlight;
> -	}
> -
> -	for (pn = pn_max; pn >= pn_min; pn--) {
> -		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> -		fxp_actual = f << pn;
> -		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
> -			break;
> -	}
> -
> -	drm_dbg_kms(&i915->drm, "Using eDP pwmgen bit count of %d\n", pn);
> -	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
> -	if (ret != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n", ret);
> -		return max_backlight;
> -	}
> -
> -	panel->backlight.edp.vesa.pwmgen_bit_count = pn;
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
> -		panel->backlight.edp.vesa.pwm_freq_pre_divider = f;
> -
> -	max_backlight = (1 << pn) - 1;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> -	return max_backlight;
> +	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
>  }
>  
> -static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
> -					     enum pipe pipe)
> +static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector, enum pipe pipe)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct intel_panel *panel = &connector->panel;
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	u16 current_level;
> +	u8 current_mode;
> +	int ret;
>  
> -	if (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> -		panel->backlight.edp.vesa.aux_enable = true;
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> -		panel->backlight.edp.vesa.lsb_reg_used = true;
> -
> -	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
> -	if (!panel->backlight.max)
> -		return -ENODEV;
> +	ret = drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.vesa.info,
> +				     i915->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
> +				     &current_level, &current_mode);
> +	if (ret < 0)
> +		return ret;
>  
> +	panel->backlight.max = panel->backlight.edp.vesa.info.max;
>  	panel->backlight.min = 0;
> -	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, pipe);
> -	panel->backlight.enabled = intel_dp_aux_vesa_backlight_dpcd_mode(connector) &&
> -				   panel->backlight.level != 0;
> +	if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +		panel->backlight.level = current_level;
> +		panel->backlight.enabled = panel->backlight.level != 0;
> +	} else {
> +		panel->backlight.level = panel->backlight.max;
> +		panel->backlight.enabled = false;
> +	}
>  
>  	return 0;
>  }
> @@ -559,16 +340,12 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  
> -	/* Check the eDP Display control capabilities registers to determine if
> -	 * the panel can support backlight control over the aux channel.
> -	 *
> -	 * TODO: We currently only support AUX only backlight configurations, not backlights which
> +	/* TODO: We currently only support AUX only backlight configurations, not backlights which
>  	 * require a mix of PWM and AUX controls to work. In the mean time, these machines typically
>  	 * work just fine using normal PWM controls anyway.
>  	 */
> -	if (intel_dp->edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP &&
> -	    (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> -	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
> +	if ((intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> +	    drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
>  		return true;
>  	}
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..1eca0b42fc45 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1790,6 +1790,24 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  		DP_MSA_TIMING_PAR_IGNORED;
>  }
>  
> +/**
> + * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backlight support
> + * @edp_dpcd: The DPCD to check
> + *
> + * Note that currently this function will return %false for panels which support various DPCD
> + * backlight features but which require the brightness be set through PWM, and don't support setting
> + * the brightness level via the DPCD. This is a TODO.
> + *
> + * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
> + * otherwise
> + */
> +static inline bool
> +drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> +{
> +	return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
> +		(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
> +}
> +
>  /*
>   * DisplayPort AUX channel
>   */
> @@ -2089,6 +2107,36 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
>  	return desc->quirks & BIT(quirk);
>  }
>  
> +/**
> + * struct drm_edp_backlight_info - Probed eDP backlight info struct
> + * @pwmgen_bit_count: The pwmgen bit count
> + * @pwm_freq_pre_divider: The PWM frequency pre-divider value being used for this backlight, if any
> + * @max: The maximum backlight level that may be set
> + * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
> + * @aux_enable: Does the panel support the AUX enable cap?
> + *
> + * This structure contains various data about an eDP backlight, which can be populated by using
> + * drm_edp_backlight_init().
> + */
> +struct drm_edp_backlight_info {
> +	u8 pwmgen_bit_count;
> +	u8 pwm_freq_pre_divider;
> +	u16 max;
> +
> +	bool lsb_reg_used : 1;
> +	bool aux_enable : 1;
> +};
> +
> +int
> +drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
> +		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> +		       u16 *current_level, u8 *current_mode);
> +int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> +				u16 level);
> +int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> +			     u16 level);
> +int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
> +
>  #ifdef CONFIG_DRM_DP_CEC
>  void drm_dp_cec_irq(struct drm_dp_aux *aux);
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
