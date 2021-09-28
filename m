Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1DF41F956
	for <lists+nouveau@lfdr.de>; Sat,  2 Oct 2021 04:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DEC6F464;
	Sat,  2 Oct 2021 02:24:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700736E96C
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 20:05:44 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 145so19809846pfz.11
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tt9tt/F3IxLyQ34cK+9pj6tNPzMMJ1v10W8CXUTZIXc=;
 b=N3sK4GpDM7NoausvCZ7uvCv2xW8y1o2GqpLxTtHdEz+qukAhK9GRVXI15tRB36rXkG
 nIIXXm2zgad8mAZpCf5s5YQsjUW2aE4PBDSL5ia/k1Nt9Mo4BFgPQLAOAlIwoYQXGXuH
 fmr97KMI5Q8zlbFdiIq/dYgMzPBdrUuYP8EE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tt9tt/F3IxLyQ34cK+9pj6tNPzMMJ1v10W8CXUTZIXc=;
 b=vEi1orz6se0xbmstTSlJN0JNpgPUc+u3vv9+cZjAHxtFaRtmOOIsCssPYN4JRgZgEF
 FdcBmKTK9NHKWbmmAbqQvQawGXQ9aiUfRVrTb+eWY0kIZ6pxkLm9TAh2xsjLo8Ukt3LC
 XEiHaRhuKnJGtuBP06Cnn98CSTB2DiIk5X3PhNMFWKOWyxDnzHlRmvYfoGGVpKWRSbon
 OUdJ94qBl/Q8GVGw3JW8gJxd7bRH1GTpyYTYOzF5wQ5PydIdBEmum8SS25SNV6zMeFZN
 /b9syAdlfTZYGjEP1GJwoBF4OV4wzCflqhTqOYjco4Lt2XWT/ja7i1sxFQ3R5TKfOAVG
 +tUw==
X-Gm-Message-State: AOAM532NnQVniTcmeh0X/wGf759FZwffe457vTbMY9afmTeYR55Cufng
 X1k9PKcT9SmDgMAER7rgoWrQPnT8zhBc+Q==
X-Google-Smtp-Source: ABdhPJxySKRj3Ymobn4cW8Zr7jA5mrjXJtwqNzCbmNi+Pwn+9z38p12fB2t6Cw7rOFPXFzcpsvOFFw==
X-Received: by 2002:a63:9317:: with SMTP id b23mr6173088pge.199.1632859543620; 
 Tue, 28 Sep 2021 13:05:43 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com.
 [209.85.215.180])
 by smtp.gmail.com with ESMTPSA id d3sm8947pfn.156.2021.09.28.13.05.43
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 13:05:43 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id m21so183471pgu.13
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 13:05:43 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr5900911ilv.180.1632859215623; 
 Tue, 28 Sep 2021 13:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210927201206.682788-1-lyude@redhat.com>
 <20210927201206.682788-3-lyude@redhat.com>
In-Reply-To: <20210927201206.682788-3-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Sep 2021 13:00:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V00-z=zvh6oZVYt7Hw00o07zEYxCa4zMrCmgNKEzcBCw@mail.gmail.com>
Message-ID: <CAD=FV=V00-z=zvh6oZVYt7Hw00o07zEYxCa4zMrCmgNKEzcBCw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, 
 Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Sean Paul <seanpaul@chromium.org>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 02 Oct 2021 02:24:00 +0000
Subject: Re: [Nouveau] [PATCH 2/3] drm/dp,
 drm/i915: Add support for VESA backlights using PWM for brightness
 control
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 27, 2021 at 1:12 PM Lyude Paul <lyude@redhat.com> wrote:
>
> @@ -3305,11 +3313,10 @@ EXPORT_SYMBOL(drm_edp_backlight_enable);
>   * @bl: Backlight capability info from drm_edp_backlight_init()
>   *
>   * This function handles disabling DPCD backlight controls on a panel over AUX. Note that some
> - * panels have backlights that are enabled/disabled by other means, despite having their brightness
> - * values controlled through DPCD. On such panels &drm_edp_backlight_info.aux_enable will be set to
> - * %false, this function will become a no-op (and we will skip updating
> - * %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must take care to perform it's own
> - * implementation specific step for disabling the backlight.
> + * panels have backlights that are enabled/disabled via PWM. On such panels
> + * &drm_edp_backlight_info.aux_enable will be set to %false, this function will become a no-op (and
> + * we will skip updating %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must handle disabling the
> + * backlight via PWM.

I'm not sure I understand the comment above. You say "enabled/disabled
via PWM" and that doesn't make sense w/ my mental model. Normally I
think of a PWM allowing you to adjust the brightness and there being a
separate GPIO that's in charge of enable/disable. To some extent you
could think of a PWM as being "disabled" when its duty cycle is 0%,
but usually there's separate "enable" logic that really has nothing to
do with the PWM itself.

In general, it seems like the options are:

1. DPCD controls PWM and the "enable" logic.

2. DPCD controls PWM but requires an external "enable" GPIO.

3. We require an external PWM but DPCD controls the "enable" logic.

Maybe you need a second "capability" to describe whether the client of
your code knows how to control an enable GPIO? ...or perhaps better
you don't need a capability and you can just assume that if the client
needs to set an "enable" GPIO that it will do so. That would match how
things work today. AKA:

a) Client calls the AUX backlight code to "enable"

b) AUX backlight code will set the "enable" bit if supported.

c) Client will set the "enable" GPIO if it knows about one.

Presumably only one of b) or c) will actually do something. If neither
does something then this panel simply isn't compatible with this
board.


> +/**
> + * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backlight support
> + * @aux: The AUX channel, only used for debug logging
> + * @edp_dpcd: The DPCD to check
> + * @caps: The backlight capabilities this driver supports
> + *
> + * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
> + * otherwise
> + */
> +bool drm_edp_backlight_supported(struct drm_dp_aux *aux,
> +                                const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> +                                enum drm_edp_backlight_driver_caps caps)
> +{
> +       if (!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP))
> +               return false;
> +
> +       if (!(caps & DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM) &&
> +           (!(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP) ||
> +            !(edp_dpcd[2] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))) {

Elsewhere you match DP_EDP_BACKLIGHT_AUX_ENABLE_CAP against
edp_dpcd[1]. Here you match against [2]. Are you sure that's correct?


>  /*
>   * DisplayPort AUX channel
>   */
> @@ -2200,7 +2182,11 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
>   * @pwm_freq_pre_divider: The PWM frequency pre-divider value being used for this backlight, if any
>   * @max: The maximum backlight level that may be set
>   * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
> - * @aux_enable: Does the panel support the AUX enable cap?
> + * @aux_enable: Does the panel support the AUX enable cap? Always %false when the driver doesn't
> + * support %DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM

Why is aux_enable always false if it doesn't support
DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM? It doesn't seem like the code
enforces this and I'm not sure why it would. Am I confused?
