Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0010932E6C
	for <lists+nouveau@lfdr.de>; Tue, 16 Jul 2024 18:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674DB10E7D7;
	Tue, 16 Jul 2024 16:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="theRsoRD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D41610E7D4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jul 2024 16:35:42 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso5880510276.0
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jul 2024 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721147741; x=1721752541; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=34oPXxwUhO+NH/fduZHAOpDo2yc0Dac2FG6FOEu8FG0=;
 b=theRsoRDFEC+OTG3OUBYDi4RWs3XsrChef4ZO8g7gLbK3QmpAm55wF/W6V8ZoM/bL5
 b1auriWtjs1ewOlYJDXT3hfzm+VvhGiex42nVXuv0yEXAbqQ8owIP19J4M4xv5Xe+jPq
 RaKdn6YlvAE9M2OEi3pncJZWDpwctVD4JVyp9JXoyYIn0+YaXSQAGAD7bWu1VLgDXBQM
 1cz3D93AjSjvy31JbJx1yoEvpUky1Eu2XJkF7t4R5M3SwXtHvHyHshUikO9hQPU6R3bd
 qeIvTiMV+WhglU/n1BKYZODeQtjE2C0iPBobIBIUGFBYLoS9WZCAnxDCp424P7XxvvAQ
 3JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721147741; x=1721752541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34oPXxwUhO+NH/fduZHAOpDo2yc0Dac2FG6FOEu8FG0=;
 b=VIAAlHoTB1BC8W5VPx+VU3YDfZjpvG4umNGT56UUA1KHU5RP5WHff0pS5lbXv/1X6a
 P32yB64N2CRn3YQDnaQ/hI1UlOEFJy3nGfDg+wpZTavLNlgi9vJ3gojI7hz6kGplXw7U
 rx2XWpvzATguv2Z8Dyh7+FrIHlQ779+QuAs6bQOdRFpMk3DbHEY9uC0zUNzr7ldfnCU/
 ivxKEbDAVWC7mka5hmsmbi5lWOqPinQKh+pVYCxCDl9SzCBdrBHGJMBWJHIPbBu+le6A
 KpCNRofsQSS4lPXjPQ8oi7z7mqFESMabasfe71fuaDK9zcmgnG87l2Ei2GNqM6nybLQi
 e3uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEVywd2i5/ECLXuOEpyvuyvWHLcXim89WhfugLD/HVSHw/0E3sLjYuDhQQcrCI27cDLrBxsW4e/2ODoAf9mRl2mfVRockhSybuQdFiTw==
X-Gm-Message-State: AOJu0YzIAu36wsh4A9AX+bb2SYY6RbqpzJ/xPhku/1v6CPQLRqcx7PE+
 FgENCTTJ2SPZtAqh9xtJ+0NrOejQ1rw9whcFzGSEwLxoW391yGMA2QXrhnd6VdSSO3Vt6iJvvGA
 +H5GnR7Y3zevT1ObjbvlefZlHGk0Vz8nsm5b6Rw==
X-Google-Smtp-Source: AGHT+IEnIAYeAeq7hqAfRb3BsofJtAOi/bF6/p/RLUOXV2Z8f4Y68QWTBl8HnA/niZH1mJfbe7NjdvQYlDEhmgv9k1o=
X-Received: by 2002:a05:6902:2510:b0:e05:b9bf:4e58 with SMTP id
 3f1490d57ef6-e05d5dfb1d4mr2951145276.25.1721147741099; Tue, 16 Jul 2024
 09:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8EJprfbMs_3PnpebhVg=NVrO5zc23cgx=1f4HAKLnT5b9J6Q@mail.gmail.com>
 <d3be8832-a6f2-496e-ac2e-9b29cae9f8f2@suse.de>
In-Reply-To: <d3be8832-a6f2-496e-ac2e-9b29cae9f8f2@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 19:35:29 +0300
Message-ID: <CAA8EJprA3aXHex4ctSE+ChhhWVLLdcXtppsadrNYbnHWi+gKLQ@mail.gmail.com>
Subject: Re: DisplayPort: handling of HPD events / link training
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, nouveau@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 16 Jul 2024 at 18:58, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 27.02.24 um 23:40 schrieb Dmitry Baryshkov:
> > Hello,
> >
> > We are currently looking at checking and/or possibly redesigning the
> > way the MSM DRM driver handles the HPD events and link training.
> >
> > After a quick glance at the drivers implementing DP support, I noticed
> > following main approaches:
> > - Perform link training at the atomic_enable time, don't report
> > failures (mtk, analogix, zynqmp, tegra, nouveau)
> > - Perform link training at the atomic_enable time, report errors using
> > link_status property (i915, mhdp8546)
> > - Perform link training on the plug event (msm, it8605).
> > - Perform link training from the DPMS handler, also calling it from
> > the enable callback (AMDGPU, radeon).
> >
> > It looks like the majority wins and we should move HPD to
> > atomic_enable time. Is that assumption correct?
>
> Did you ever receive an answer to this question? I currently investigate
> ast's DP code, which does link training as part of detecting the
> connector state (in detect_ctx). But most other drivers do this in
> atomic_enable. I wonder if ast should follow.

Short answer: yes, the only proper place to do it is atomic_enable().

Long answer: I don't see a way to retrigger link training in ast_dp.c
Without such change you are just shifting things around. The
end-result of moving link-training to atomic_enable() is that each
enable can trigger link training, possibly lowering the link rate,
etc. if link training is just a status bit from the firmware that we
don't control, it doesn't make real-real sense to move it.

>
> Best regards
> Thomas
>
> >
> > Also two related questions:
> > - Is there a plan to actually make use of the link_status property?
> > Intel presented it at FOSDEM 2018, but since that time it was not
> > picked up by other drivers.
> >
> > - Is there any plan to create generic DP link training helpers? After
> > glancing through the DP drivers there is a lot of similar code in the
> > link training functions, with minor differences here and there. And
> > it's those minor differences that bug me. It means that drivers might
> > respond differently to similar devices. Or that there might be minor
> > bugs here and there.
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


-- 
With best wishes
Dmitry
