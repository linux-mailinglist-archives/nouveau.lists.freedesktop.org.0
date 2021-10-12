Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007164324D1
	for <lists+nouveau@lfdr.de>; Mon, 18 Oct 2021 19:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6B06EA93;
	Mon, 18 Oct 2021 17:18:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E70D89D67
 for <nouveau@lists.freedesktop.org>; Tue, 12 Oct 2021 20:45:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id x1so425351ilv.4
 for <nouveau@lists.freedesktop.org>; Tue, 12 Oct 2021 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niP7v3xFwLnCjLXmT0nzm06tTYa6qI3k7igZv8TEJsc=;
 b=MrnlfgVEgsrzhHRtZFc5utknl/ytW5WjQcYfTv2HnZ6fS9lKKuW+F42Nrbx+gHripS
 Xc2RIA6gaKDSc/bn3xBmR20a0BtY+7gzFpyZmggMd//w3Ub3xZ+2jCun1uq9tVGlgJIT
 sVMI8bJ+eODJIFrgH34toluuVDOHJLd8ha9UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niP7v3xFwLnCjLXmT0nzm06tTYa6qI3k7igZv8TEJsc=;
 b=OmD1E3F+wMkCUGK5F6SyMpPMZ94pMOl11qsAi6Np5v9zwD1PtMDKZL4JWlh5DesN3/
 8kz53KV/hGXEHjKuxd38Xtkn/QoqgWS63Zv0lw6jb1wwbnOcbE0Fn1UHqoLmAOQ0NaKJ
 QKM2Jtux9JegxDeApRStwaSAuMjGLrYQUZAOP40BsesLesWH/7HVUFBq5EIFXaCIeGEW
 tJcT1Ja+GVKGZto+5vMdcWZduyoIe68oAIQT0QnXpPggFPv9HKkjoB7cMw1Fg6rNpNI9
 Xl41vLTgVTTuUjcCjZE0kifmasuFh1X8GfZlhoOGE/nY90uMu+5HTIL470RM7XJ1N+W/
 kVqg==
X-Gm-Message-State: AOAM532wNkud7Ed+Cc1dvkR3iftbl3SrUheiaeuizSHy667DT302RoJF
 uWAuVj1l8+qnMgC+BdKOG8NoLkzGylh4Qg==
X-Google-Smtp-Source: ABdhPJz8CvClB0ChZ53x12h90qoyg1ERUK+tZ627EW/KoOs7WF4UhfjIKWLee4I28FuH8BZJYQXilA==
X-Received: by 2002:a05:6e02:1646:: with SMTP id
 v6mr15080516ilu.140.1634071517224; 
 Tue, 12 Oct 2021 13:45:17 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id y30sm6280692iox.54.2021.10.12.13.45.15
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id e144so379025iof.3
 for <nouveau@lists.freedesktop.org>; Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr25937447iog.98.1634071515111; 
 Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-5-lyude@redhat.com>
In-Reply-To: <20211006024018.320394-5-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Oct 2021 13:45:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WV15+qBBA8ZcgxwOQ=i_LHsytdrUWyqZHZZBwuJJ6CFQ@mail.gmail.com>
Message-ID: <CAD=FV=WV15+qBBA8ZcgxwOQ=i_LHsytdrUWyqZHZZBwuJJ6CFQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Rajeev Nandan <rajeevny@codeaurora.org>, 
 Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Oct 2021 17:18:27 +0000
Subject: Re: [Nouveau] [PATCH v3 4/5] drm/dp,
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

On Tue, Oct 5, 2021 at 7:41 PM Lyude Paul <lyude@redhat.com> wrote:
>
> @@ -1859,8 +1859,7 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  static inline bool
>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
>  {
> -       return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
> -               (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
> +       return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
>  }

nit: I don't believe that the "!!" is needed in the above. C should
automatically handle this since the return type of the function is
"bool".

I've reviewed the generic (non-intel) code and it looks like a
reasonable approach to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
