Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC71A6DD0
	for <lists+nouveau@lfdr.de>; Mon, 13 Apr 2020 23:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5389DA6;
	Mon, 13 Apr 2020 21:12:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Mon, 13 Apr 2020 21:12:57 UTC
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272289DA6
 for <nouveau@lists.freedesktop.org>; Mon, 13 Apr 2020 21:12:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A5F2520020;
 Mon, 13 Apr 2020 23:07:27 +0200 (CEST)
Date: Mon, 13 Apr 2020 23:07:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tejun Heo <tj@kernel.org>
Message-ID: <20200413210721.GA802@ravnborg.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
 <20200413204243.GL60335@mtj.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413204243.GL60335@mtj.duckdns.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=cV37oKmrZChnzrZEKpEA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Subject: Re: [Nouveau] [PATCH 1/9] drm/vblank: Add vblank works
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Tejun

> 
> And, thanks a lot for the vblank explanation. I really enjoyed readin it. :)

You were not the only one who liked it :-)

We ended up with an updated explanation in drm_vblank.c:
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_vblank.c

Including some nice ascii art in the final version.

It will hit upstream in next merge window.

	Sam
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
