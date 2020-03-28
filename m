Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5003196998
	for <lists+nouveau@lfdr.de>; Sat, 28 Mar 2020 22:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9372D6E184;
	Sat, 28 Mar 2020 21:49:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758076E183;
 Sat, 28 Mar 2020 21:49:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 519CF8040D;
 Sat, 28 Mar 2020 22:49:39 +0100 (CET)
Date: Sat, 28 Mar 2020 22:49:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20200328214937.GA9505@ravnborg.org>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=Ej2OcDn8OD74Q5IJgyMA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Subject: Re: [Nouveau] [PATCH 0/6] gpu: convert to use new I2C API
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> We are deprecating calls which return NULL in favor of new variants which
> return an ERR_PTR. Only build tested.
> 
> 
> Wolfram Sang (6):
>   drm/amdgpu: convert to use i2c_new_client_device()
>   drm/gma500: convert to use i2c_new_client_device()
>   drm/i2c/sil164: convert to use i2c_new_client_device()
>   drm/i2c/tda998x: convert to use i2c_new_client_device()
>   drm/nouveau/therm: convert to use i2c_new_client_device()
>   drm/radeon: convert to use i2c_new_client_device()

With the ack from Alex I went ahead and applied the patches to
drm-misc-next.

	Sam


> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c        | 2 +-
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     | 8 ++++----
>  drivers/gpu/drm/i2c/sil164_drv.c               | 7 +++++--
>  drivers/gpu/drm/i2c/tda998x_drv.c              | 6 +++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_atombios.c       | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c        | 4 ++--
>  7 files changed, 19 insertions(+), 16 deletions(-)
> 
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
