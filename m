Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8585BE381
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 12:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD310E4CF;
	Tue, 20 Sep 2022 10:42:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7968D10E15C;
 Tue, 20 Sep 2022 10:42:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u9so5113888ejy.5;
 Tue, 20 Sep 2022 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date;
 bh=uuydgXOSSksfr9Wyq7NKGaPAiF6c3Reu1UAxFxmEiTQ=;
 b=X4DfW+U+f0cZYYYqTcRT72yreLfwGmRHWSB++4/8buUAuPgoP6yq/yT+uUKlHoIzsM
 en3a/qzodvYR4u+LZX3AThvtnHGZAEpRaQrdZyi5FzVCetBjBSQ/hlxABmLmdqZlMhut
 SQxYbg6dsrUiObFIOZnurBBxD0eksZBXWy2r+HnH3/fiVmK2zbwA0Xd1wztBrhuqJ+1R
 yvk+jKdz9BnCEha10h7Gac34Z+I2bc+NhWhe15WTDM7YpDmaeQeDYuPI4SLl2dcFHA2q
 PUCyyg1ZZPmgwP//6LTBjJsOSVVzp9cXBDeedh3KCFipRMpjIdlANC9YElnuskkHyvHV
 XM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uuydgXOSSksfr9Wyq7NKGaPAiF6c3Reu1UAxFxmEiTQ=;
 b=2ML78lGqX0B7kwVQC8YhM4F3HrHOd2hvDVSmUfbDY8yKf6Pi3jffJ6cUMsLMcvCjVU
 nnek+hH3BPC2F6JC7SHqldeGRZSFbKmtIENN4VY8WCdzBqrkwwJVuVuyrbSYl24m5W+M
 TEf2OrFVrlc7wZiq3co7WrhZvQuPwBSY9bjE/+yUV4ARcD+kPLuKlyzTv+RtK0mOUmNO
 SbMjTwMub1CXjN/ymqhgRqzz3ySwiUZXXFDepKsoCmK9clVHdrJiOfzOdQ2+NrsJzOKA
 8a6qFj1NZmkwhHukI4NIm+RGTwJq4OsmIgKc6LX2Kw0PpWaZVZLdDwLgpWrFXSEaHcFs
 /sIQ==
X-Gm-Message-State: ACrzQf0FMMafIKulFzpCEjRsfp77NYX6GP+Hp4RmfKCebIZAp9lPw7R5
 H3yVm0Nt+ZaVRmNCdFMYp1s=
X-Google-Smtp-Source: AMsMyM5M+QXEiRZTgdDrT2fyRm961CHm+K4bmMwaUe7vgkqriTlvJfhJvJG0blTD66q8ok8QlE3KKA==
X-Received: by 2002:a17:907:2d2a:b0:77e:def7:65e9 with SMTP id
 gs42-20020a1709072d2a00b0077edef765e9mr16196840ejc.85.1663670524165; 
 Tue, 20 Sep 2022 03:42:04 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060f9000b0077f15e98256sm606055ejj.203.2022.09.20.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:42:03 -0700 (PDT)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 0B006BE356D; Tue, 20 Sep 2022 12:42:03 +0200 (CEST)
Date: Tue, 20 Sep 2022 12:42:03 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YymY+3+C2aI7T3GU@eldamar.lan>
References: <20220819200928.401416-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819200928.401416-1-kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 19, 2022 at 10:09:28PM +0200, Karol Herbst wrote:
> It is a bit unlcear to us why that's helping, but it does and unbreaks
> suspend/resume on a lot of GPUs without any known drawbacks.
> 
> Cc: stable@vger.kernel.org # v5.15+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35bb0bb3fe61..126b3c6e12f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>  		if (ret == 0) {
>  			ret = nouveau_fence_new(chan, false, &fence);
>  			if (ret == 0) {
> +				/* TODO: figure out a better solution here
> +				 *
> +				 * wait on the fence here explicitly as going through
> +				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +				 *
> +				 * Without this the operation can timeout and we'll fallback to a
> +				 * software copy, which might take several minutes to finish.
> +				 */
> +				nouveau_fence_wait(fence, false, false);
>  				ret = ttm_bo_move_accel_cleanup(bo,
>  								&fence->base,
>  								evict, false,
> -- 
> 2.37.1
> 
> 

While this is marked for 5.15+ only, a user in Debian was seeing the
suspend issue as well on 5.10.y and did confirm the commit fixes the
issue as well in the 5.10.y series:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#69

Karol, Lyude, should that as well be picked for 5.10.y?

Regards,
Salvatore
