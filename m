Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31E9EC873
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 10:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5353710EAD4;
	Wed, 11 Dec 2024 09:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m9WTlTne";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E9510EAD2
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 09:08:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso4841525e9.3
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733908128; x=1734512928; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
 b=m9WTlTnerA/rr5OuHyqW60qnb4eKtj+T1YJGi7OUSZT/0UxuX4xV9MMUQYoMIYI5Bt
 QiqEPJdKEzBRbs3/00fKWwSYAUgfnNP5vajlNBrZ8twpg3LWvUMxo68wUZSfZHB9XYuN
 JAZ0al7NYCAD6XZ4a5Q9a2PMsMYAyOS6vMLR6YRwrFSvnUyM1+Zp8f/pZzkDRYTqFQbi
 0bZarWkKHRF+qRx7TygkGvj50Ykl8vHIV2U1QTUhhvl6iK9ABd6mudUL788dodFcHSOM
 eyq63ogNqXfqSRltb9HbwVxZ8j1GUOdFo0K9ovJ5b2Js76TPlHjUiZ1TzK4Z/GbpoybP
 or7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733908128; x=1734512928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
 b=QpHh8vGZ6VWkEHyrbIoZ2ymmjM5XR9ElxXx6ImMjisiMkRWuTMnsIivlW7pwB9VAV/
 S0vqHR2RrXyTAPOi00aiw8DnEJ9w8aVNmEXhM75anv+AdzXDaeFikBKs53ZLnHPAhOaM
 UDSC3tWck1+BP72TXy7MqNb/wx1bsbnx/0E+imIy6hQH7c1WMYjy7En/2h7ebelIqD6i
 vrQg/IkRvgl5KmMkvg09uksLhu7I5cSUEbbJLlv8gLGlYyzK886seQRORsdSDZMsGScZ
 Jz+P9rhMFx1QZOITB+swf0Vt1jCDTp5SDzKfp6/4QZ25hN4Y0tBqJzVWOmVAor+edxf/
 qglA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBn+FR2kZH0pPUjkQ163HwkC3UReQvW1V71zsDZR4jUEnz1CSNRgx7zIiIZLGJnRuEMVzTC26C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKkK5cz+1un3R1X80269eQYHCLH4rZbVYWa0Dh6u/NcyrdVtid
 nVjpKCgpvUSNh3l3tGDe9qffgTz1nO6ujxXIXFyvmhI50VS89H7BIeWeIg87Bdk=
X-Gm-Gg: ASbGnctu/lSF0Ak5yVEFa8ZEDTAFcL6r6KmrYtSAwNKEhOz5svPxDYiVu3erOqEx9fC
 xaNucujkAtxDbEemZaXynDVIjXKC1iX2RBFwFTEBk6jwzu0ljv7VDsBEVgfAoqqagR6ZPSQtP6U
 xcEB6p7apYmi0jyj9Ilt3RfVbBbubukSWRptxfLaSBt2l1W5EHuJMydOGAbwT1gTG9rULcMOWMu
 dc8MMog/2UJFClPd4nG5gq1IfYyd9CEtFLUhnjpd3OvHVkSeby8
X-Google-Smtp-Source: AGHT+IGD0J/JRFizsjyOq9cq12J2ujkcAmyNKzRhsrMcAI97nrwbSWWcCwaN8qi6JkWUTmtl0C7NHQ==
X-Received: by 2002:a5d:64cf:0:b0:385:ec8d:8ca9 with SMTP id
 ffacd0b85a97d-3864cec5b76mr1446900f8f.42.1733908127884; 
 Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a4815sm807610f8f.26.2024.12.11.01.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Date: Wed, 11 Dec 2024 11:08:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <Z1lWnY+TxSptkBiY@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
 <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
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

On 24-10-31 18:44:55, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them.
> > So use the drm generic helper instead as it makes the code a bit cleaner.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
> >  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
> >  
> >  		if (nr) {
> > -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +			drm_dp_lttpr_set_transparent_mode(aux, true);
> >  
> >  			if (nr > 0) {
> > -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> > +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
> >  				if (ret != 1) {
> > -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +					drm_dp_lttpr_set_transparent_mode(aux, true);
> >  				} else {
> >  					outp->dp.lttpr.nr = nr;
> >  				}
> 
> Could you please extract this true-false-true dance to a new helper too?
> This way Intel driver can use the simple helper, the rest of the drivers
> can benefit having the common code.

Will be part of the new version.

> 
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
