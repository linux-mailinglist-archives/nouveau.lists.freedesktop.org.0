Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D893E2FBBC1
	for <lists+nouveau@lfdr.de>; Tue, 19 Jan 2021 16:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3236E3E3;
	Tue, 19 Jan 2021 15:56:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jan 2021 15:56:37 UTC
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE976E3E3;
 Tue, 19 Jan 2021 15:56:37 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B600700080001>; Tue, 19 Jan 2021 07:51:36 -0800
Received: from [172.20.40.72] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 15:51:32 +0000
To: Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
References: <20210119015415.2511028-1-lyude@redhat.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <65703839-5eca-4a82-d13a-7d1a68ec9bc2@nvidia.com>
Date: Tue, 19 Jan 2021 07:52:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119015415.2511028-1-lyude@redhat.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611071496; bh=tQD7OEZUyDNkeJOYKrKuZ5zUmlJB5oM1e1SlcLNGXxA=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=As3l2i5totSVra/HUe0wHaODZ9prvkub6QNpNkm91St2BJw4yDN1lUjNgLddQaCDm
 fLVoj9J9r8eUoQv7bZLU0045kIa7bmKckF8kVXYsFmanXK6ZD0D5uNBBABdWUYgdkU
 TMUoa68zztbnafKdeRkkajZfQVPqAVdG6CAeVNRlfQ70te7D3mEC6qjkaRsfKPR7Ll
 1VY+6nhClXQnEMNSW5sNayp0OPyOXK1jJyw4TQz5uB62oXqRDVrT5SZw1D9I0gOOAR
 DG7DSHgpuE/1L3DPujxBZzIKwtjy7mwrRtlka/+1sPdjL+fSubvSUr6r0ywSVjqTiQ
 A2CFWPTJIkuQQ==
Subject: Re: [Nouveau] [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format
 modifiers for cursor planes
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
Cc: David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Nirmoy
 Das <nirmoy.aiemd@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Gah, yes, good catch.

Reviewed-by: James Jones <jajones@nvidia.com>

On 1/18/21 5:54 PM, Lyude Paul wrote:
> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.
> 
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
> Cc: James Jones <jajones@nvidia.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index ce451242f79e..271de3a63f21 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -702,6 +702,11 @@ nv50_wndw_init(struct nv50_wndw *wndw)
>   	nvif_notify_get(&wndw->notify);
>   }
>   
> +static const u64 nv50_cursor_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
>   int
>   nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>   	       enum drm_plane_type type, const char *name, int index,
> @@ -713,6 +718,7 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>   	struct nvif_mmu *mmu = &drm->client.mmu;
>   	struct nv50_disp *disp = nv50_disp(dev);
>   	struct nv50_wndw *wndw;
> +	const u64 *format_modifiers;
>   	int nformat;
>   	int ret;
>   
> @@ -728,10 +734,13 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>   
>   	for (nformat = 0; format[nformat]; nformat++);
>   
> -	ret = drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw,
> -				       format, nformat,
> -				       nouveau_display(dev)->format_modifiers,
> -				       type, "%s-%d", name, index);
> +	if (type == DRM_PLANE_TYPE_CURSOR)
> +		format_modifiers = nv50_cursor_format_modifiers;
> +	else
> +		format_modifiers = nouveau_display(dev)->format_modifiers;
> +
> +	ret = drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw, format, nformat,
> +				       format_modifiers, type, "%s-%d", name, index);
>   	if (ret) {
>   		kfree(*pwndw);
>   		*pwndw = NULL;
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
