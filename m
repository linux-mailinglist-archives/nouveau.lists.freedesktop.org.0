Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F33373FE
	for <lists+nouveau@lfdr.de>; Thu, 11 Mar 2021 14:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9CC6EC7C;
	Thu, 11 Mar 2021 13:31:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BEC6EC7F
 for <nouveau@lists.freedesktop.org>; Thu, 11 Mar 2021 13:31:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l11so1880708wrp.7
 for <nouveau@lists.freedesktop.org>; Thu, 11 Mar 2021 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=CIIAC/BD4HiWZJv5qwhQ9qfLc69qrTy9QBuntzXqyQsbcdQGtlF0Uxjcy0ZFTg+b8P
 sfXuhYSDbtS+1H84ubJowHGoova+nTvdE4WmseXf7gU0a1+St18coJMHpU4NlUAqNlBn
 G6gVDx+Mqi73FbYtvA+zLBz4Tt2LtFMujxiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=VGL980TyyuS76sQvez2ipfmtBs8ApyjWDJ9NduI8VMj6NTvZSWjj0rmO+sBTnUKSAW
 ApiIp2UOuhHf6mBA/JCWyPi3Spsd42hbTMyUUvRKjPFfviQCLhfA2NP7iN6yh89Nc1KO
 JkHrAIWzVuFhXyf3uzWb2E5JhAtbDBNmlbad8oeB4dv+g5gwU+K6fEP2GaVmpnMtsy9F
 nt40MouxuQJse13xEMNPNN2cRh0bLHZ+AC0JTOL8APgPOVixUKMLqFIe0wLQAOGmIAJ2
 qFM6F+q9gYcnu2uuAGFd0m5dc5+zFfVH4fZDzV+AU7lEqYFw+O1DqXpF2+/BA++zvDIV
 gicQ==
X-Gm-Message-State: AOAM530MUpKWd8MGSonU+Q56NuUNZ2mUG5pfEjrIysWeD+gf5PWVkXFL
 zwvepFsFc/yVnICsCBfjXEzpjw==
X-Google-Smtp-Source: ABdhPJxEmOy2Yvf9KHNGocEPM7wKMMIxgjmjn3qYWtNne7YIpJNNmJ0zRgu4I8/UJrCDTEqBBwHj5w==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr8924011wrv.348.1615469516566; 
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm3590049wml.42.2021.03.11.05.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Date: Thu, 11 Mar 2021 14:31:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308091932.GB4931@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 linux-media@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> 
> > The vmwgfx ones look all good to me, so for
> > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > That said, they were already signed off by Zack, so not sure what
> > happened here.
> 
> Yes, they were accepted at one point, then dropped without a reason.
> 
> Since I rebased onto the latest -next, I had to pluck them back out of
> a previous one.

They should show up in linux-next again. We merge patches for next merge
window even during the current merge window, but need to make sure they
don't pollute linux-next. Occasionally the cut off is wrong so patches
show up, and then get pulled again.

Unfortunately especially the 5.12 merge cycle was very wobbly due to some
confusion here. But your patches should all be in linux-next again (they
are queued up for 5.13 in drm-misc-next, I checked that).

Sorry for the confusion here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
