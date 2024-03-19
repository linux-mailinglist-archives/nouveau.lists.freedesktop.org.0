Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76A880396
	for <lists+nouveau@lfdr.de>; Tue, 19 Mar 2024 18:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874EF10E909;
	Tue, 19 Mar 2024 17:38:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A3A10E909
 for <nouveau@lists.freedesktop.org>; Tue, 19 Mar 2024 17:38:31 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1rmdPx-0009aH-0m
 for nouveau@lists.freedesktop.org; Tue, 19 Mar 2024 18:38:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Maden <terminatorul@gmail.com>
Subject: Re: [PATCH] nouveau/gsp: don't check devinit disable on GSP.
Date: Tue, 19 Mar 2024 19:38:22 +0200
Message-ID: <utciie$rai$1@ciao.gmane.io>
References: <20240314014521.2695233-1-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20240314014521.2695233-1-airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

Hello

Can this be merged please ?

On 3/14/24 03:45, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> GSP should be handling this and I can see no evidence in opengpu
> driver that this register should be touched.
> 
> Fixed acceleration on 2080 Ti GPUs.
> 
> Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> index 666eb93b1742..11b4c9c274a1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> @@ -41,7 +41,6 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
>   
>   	rm->dtor = r535_devinit_dtor;
>   	rm->post = hw->post;
> -	rm->disable = hw->disable;
>   
>   	ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
>   	if (ret)


