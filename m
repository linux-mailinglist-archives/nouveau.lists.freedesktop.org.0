Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630419FE6A7
	for <lists+nouveau@lfdr.de>; Mon, 30 Dec 2024 14:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8CD10E4DC;
	Mon, 30 Dec 2024 13:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b5HRTxl4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A710E4D1
 for <nouveau@lists.freedesktop.org>; Mon, 30 Dec 2024 13:45:48 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3023c51146cso95863221fa.1
 for <nouveau@lists.freedesktop.org>; Mon, 30 Dec 2024 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735566287; x=1736171087; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UfDexyA0DqveLsLqtnhae+vl3u+416UboJrWSd6o/F8=;
 b=b5HRTxl4PaMnLHpmt4oLauDDY4RBxZUkRQfZQU/wiDV6WHR9HRiUAHl2pnaJt+toyZ
 gyzO4TFj8T/4eS5jKnC4Cp4vxLZcEsBvj5ouRQ+mUHyoGvPV/ijXtyQIMyVgNjVauVQ4
 1v70/N3iHHqILWGSr/fw2ZspPntiJFghs8da4+axmpfR78ACk2sA4q6oZ9Q3wqt95JLg
 in8WXvB/+i3INyFIfqAciWjUWcddBZHnzd+mjA/koY+7Zqn4eGczpBcHD42p0vQoJvCy
 hdVxqOT29mQamAqOxq5IrSOIp0B+PVCMEyIwBDfKF4YjdDg1JCiWIQ6GjxUCfwQFfttK
 znjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735566287; x=1736171087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfDexyA0DqveLsLqtnhae+vl3u+416UboJrWSd6o/F8=;
 b=RCPl9SOT5TLYOQ4btxQFcZP1bvRwW/6KThbpu5DCPrsWZ5LjJ78wEf2mBbI38RLH9Y
 NcAGqhg8O9L+aLszoa3sF1PrvnRMQNcdJxvUQ5wEhajNUobOXzypws1L9TIBrd2dw+9v
 gNdEXvlEmaF3dSZLP1/WsDFTObxWA2Jxm9KdENWSlZFxlkFnv3P7Y8t67Dap+5R1jPJS
 vJaSLS4WQTmsJtm+sB9Xks8L5EE45nTncmXHATQr06kiXPuIJDZw6hXKUDCxqVTNMUnY
 D8o9QJRL4pH4+seeLFl5V4uhKISskYcEZLe/84/izpdhOkwupd7mfBoyMrJyf0duNc3j
 CdJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsdTwvH6CY+AlDyW7+uyzY/S2T2dNBir5cGK8Al7kANn36ojz4Nm+LoBU+gTetbCLFGH+22u50@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzgBNF29Xr+u/FvGYbNFI5d9HYvoj6whWIFu9XN9ZGX0gq3RLk
 l/V1FNFw/5c66Y9e1DUCTRk7QIdIPXTXM4BmwXiobPB7Pn88N7AgqeAxgtKvcjU=
X-Gm-Gg: ASbGncuBD7yoS06IHtJhX9GmXGTSTKdgrmmNBc2a4cUXHcUnkjm7wGhu/1ThAppoyyl
 D7EpVgacXmRJbdq+RGRCkTOWoRaI5RVZmriH61cbNV5/2QeoOXTj9T7dJEjdkBdzgziZngvjVbo
 YqU7sHXax8judEIE0FiZ0m1LBCqfFFJgqNejX6mHoxkXshjKGkyGWwO8HstSTCypUVwKeV+v/UA
 BwH22/ZEj+NLnchyEbqxkozvc5jC/zQA7r/uGVoJv+9eCCwv2sk1Boy30tLbVDNYQI7GJU2zezG
 A6rTkS/hqs6uTaGHI1WigKe+r/SZMQQC5vjk
X-Google-Smtp-Source: AGHT+IHpedEDXvGR6WWPSvUrtH/iHawQ5u1rIIGMmoB8TGBeVGZEVGcJvivwA+rB6+81ya8nOnGl3w==
X-Received: by 2002:a05:651c:2118:b0:302:23bd:354b with SMTP id
 38308e7fff4ca-30458337837mr126671731fa.1.1735566286830; 
 Mon, 30 Dec 2024 05:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082d56sm34889051fa.106.2024.12.30.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 05:44:45 -0800 (PST)
Date: Mon, 30 Dec 2024 15:44:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <lnbvudvkvgifbjmscgrvv5hkuescyqz57y6m2pydphyq2ubrhg@aynvaqlu7jz3>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <Z21VD82XCOVgVJUh@linaro.org> <877c7hpavo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c7hpavo.fsf@intel.com>
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

On Mon, Dec 30, 2024 at 03:18:35PM +0200, Jani Nikula wrote:
> On Thu, 26 Dec 2024, Abel Vesa <abel.vesa@linaro.org> wrote:
> > On 24-12-11 15:42:27, Johan Hovold wrote:
> >> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> >>  
> >> > +/**
> >> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> >> > + * @aux: DisplayPort AUX channel
> >> > + * @enable: Enable or disable transparent mode
> >> > + *
> >> > + * Returns 0 on success or a negative error code on failure.
> >> > + */
> >> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> >> > +{
> >> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> >> > +
> >> > +	return ret == 1 ? 0 : ret;
> >> 
> >> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> >> sure it never returns 0 (for short transfers).
> >
> > Will follow Dmitry's proposal here.
> >
> > 	if (ret < 0)
> >         	return ret;
> >
> > 	return (ret == 1) ? 0 : -EIO;
> 
> Arguably this (well, with ret == len) is what we should've done with
> *all* of the drm_dp_dpcd_*() functions. I don't think there's a single
> case where we'd actually need to know that some but not all data was
> transferred. And if there are, they could be special cased. Now we have
> hundreds of cases where we check against length and it's just cumbersome
> all over the place.
> 
> The question is, how confusing is it going to be to have some of the new
> functions return 0 instead of len? Very? Extremely?
> 
> As painful as it would be, I'd be in favor of changing them all to
> return 0 on ret == len. If we find a volunteer.

Maybe a correct Coccinelle script can do a significant part of such a
conversion for us?

Anyway, I think it a right thing to do. Could you possibly add a new set
of API and use it inside i915 driver? Then during the next cycle we can
start using new functions for all other drivers. Or would you rather add
new API through drm-misc? Then we can concert e.g. existing helpers in
the first place and then start working on the drivers.


-- 
With best wishes
Dmitry
