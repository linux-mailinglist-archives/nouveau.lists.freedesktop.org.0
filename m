Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B7624744
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 17:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A0C10E002;
	Thu, 10 Nov 2022 16:43:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DE810E002
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 16:42:58 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso2028280pjc.2
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 08:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
 b=IruV/cOGCppTZMecE2WVY8zukl+kcYVeoo7vFWW6yGTBj+JNzqw7SwdygU11Ap5tXp
 +IWICnrL7OpPlowtcizxkZ8u7fNIf7VOdlhb+UCVVdiNOgc1eLngTeYpENadc4W7k2ql
 lwVFIi2Zm+49ixbK5qXD6pVFvTfaAaG7iPD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
 b=M3MBTyUzu4bn5+1Om3Glfs6vJcYPM4fvwpo69milQeo6uxLgUE9ni4QbdqfD3SThIX
 pzr0S2omNDS0aH9SgYa2cJIX4zrHOEE1ooqol1H2tC3ry6az2zpTSgkXWCicXiWPtFG0
 sLLVuytwgofszZQBT1BUu50GH+jJKWp1xf5wc8Jn/76ALTuZcwitM7NygfyCFNVWJf6p
 nDQQqbZyAS6Gt8fnf7okrFvmyDmeJHRJBPw5YW70xdLTDha5AtvVpOqAoOZrxH+5quRd
 wKnKSXsq5A5+M6j0XFYFy+WG4TvAhUfwnyy8IDODtkB2SmA/oS3yQBGK6TcjAkIza1ww
 AYwA==
X-Gm-Message-State: ACrzQf1V8hg9YJ6OZWJNSJs2HXux45smnkr6z8fcrmw2n62nlEDDE/r8
 QPARXni/v/2PRVNfkmUZCSKyNg==
X-Google-Smtp-Source: AMsMyM4zFp+Wrf9N4R4CuG0pbWGCwDSSClCq2oRdgHwJJKI1w+NXOW7FDTxl0KXE16WpLHC9sb8z8g==
X-Received: by 2002:a17:902:82c2:b0:188:5581:c8de with SMTP id
 u2-20020a17090282c200b001885581c8demr1293917plz.140.1668098578376; 
 Thu, 10 Nov 2022 08:42:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b00186f0f59d1esm11373906plb.192.2022.11.10.08.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:42:58 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:42:57 -0800
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <202211100842.076585A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Nouveau] Coverity: nv50_hdmi_enable(): OVERRUN
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 08:22:02 2022 +1000
    f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

Coverity reported the following:

*** CID 1527272:    (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:801 in nv50_hdmi_enable()
795
796     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
797     	} else {
798     		size = 0;
799     	}
800
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
801     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, &args.infoframe, size);
802
803     	/* Vendor InfoFrame. */
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
drivers/gpu/drm/nouveau/dispnv50/disp.c:810 in nv50_hdmi_enable()
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
807     	else
808     		size = 0;
809
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
810     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
811
812     	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
813     }
814
815     /******************************************************************************

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527272 ("OVERRUN")
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

It looks like this should address &args not &args.infoframe, if the
intention is to include the "data" member.

Thanks for your attention!

-- 
Coverity-bot
