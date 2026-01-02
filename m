Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F0DCEDA8E
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 06:27:40 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E924C10E070;
	Fri,  2 Jan 2026 05:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NwDFmrWa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F71B44C8C;
	Fri,  2 Jan 2026 05:19:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767331175;
 b=P1WONlV6BRONGq929EMoDzWIKlXcoAlcdAM272XY9XrRAYBT9MsFDB3qFlEVFHbsBzEuc
 EIV1wG+v+7Ohjop4CVdKhjcJLGa7bhT6Ir38v9ODCNGncCqnYq8d3sHjj1xJuU1vMZ5evnu
 L/yqgSD5jn0MS4vbLatPyYX005vNPqoDV96cStSdkAANLYF5/28fwvqc3aVE7KMp5ATs4jt
 GvPAxjw+LYThiu+xJkG1gBrW5eBci5mmOT+Bw9QcXU8nI+Zrb34WA3nzAO693lKROuY+g0s
 bfNmn2VIqKjuXM+AcXatOFixBcaEvtSIKKs9rKtWBpeX2uogdK5N6FyozyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767331175; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=almuXI3SViusCUeHM6QvVMkIRXAb18JyRush9mjGRLY=;
 b=zqS2mwz+OZ1l/X+hUj+nmqu+vcxwzQZkDO+EQE676p/b6Lt6zPGRUBx2k3YppBxKvadBw
 6M6DcO7O2VrEbND3JmqtqPQqZC8CXc/mAZQ6U0KYVG7TXewD0woqawrU/ea0olbZf7PsmqZ
 lk8WKDa/6SS/H7OYL6jtH1P+EGWve0TFCC0WB6iVImIu4Em/OEfPPoTR1AAliR4ghzdrSm6
 55dv1/g9STzVVWydCUHYy9zT5E72DbnjsYx4mRXn4bwY7UX7CvXbI1Mt3Hli5ViV0e4SLhF
 xp1a4sEoaKekIy26MAnTi66xU/IKIDNfoPqQoBl4S182x3cU/rCqAe0h9BJw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C13644C85
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 05:19:30 +0000 (UTC)
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jan 2026 05:27:33 UTC
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0410E070
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 05:27:33 +0000 (UTC)
Message-ID: <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767331291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=almuXI3SViusCUeHM6QvVMkIRXAb18JyRush9mjGRLY=;
	b=NwDFmrWa46mhH5e1xAQiK4ZhYU7J1Vu4vsMhpMlzZp+9NCKAfzNWmqFtHISypBi01UacBf
	De9IGVwsHvAnTxSXwvqh31GneA1XrCH95qjz0sVA5EmIrA6D+UYuCnLU9l3FtZf+qmarWh
	VL8axxhyJIJzJdTyH2TEyXCyomP/wJk=
Date: Thu, 1 Jan 2026 21:21:26 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20260102041829.2748009-1-airlied@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <20260102041829.2748009-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: GSSVMKEBO6EAMTSMJTEGPAEI3PKAEQ7D
X-Message-ID-Hash: GSSVMKEBO6EAMTSMJTEGPAEI3PKAEQ7D
X-MailFrom: matthew.schwartz@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GSSVMKEBO6EAMTSMJTEGPAEI3PKAEQ7D/>
Archived-At: 
 <https://lore.freedesktop.org/4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/1/26 8:18 PM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> The changes to always loads fwsec sb causes problems on newer GPUs
> which don't use this path.
> 
> Add hooks and pass through the device specific layers.
> 
> Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")

Closes: https://lore.kernel.org/nouveau/59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev/
Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Thanks,
Matt

> Cc: <stable@vger.kernel.org> # v6.16+
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
>  7 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 35d1fcef520bf..b3e994386334d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -29,6 +29,9 @@ ad102_gsp = {
>  	.sig_section = ".fwsignature_ad10x",
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
> +	
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
>  
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> index 5037602466604..8d4f40a443ce4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> @@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
>  }
>  
>  int
> -nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
>  {
> -	return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> -				   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> -}
> -
> -void
> -nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> -{
> -	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> +       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> +                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
>  }
>  
>  int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> index d201e8697226b..27a13aeccd3cb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -47,6 +47,9 @@ ga100_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index 917f7e2f6c466..a59fb74ef6315 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -158,6 +158,9 @@ ga102_gsp_r535 = {
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +	
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 86bdd203bc107..9dd66a2e38017 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
>  
>  int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
>  
> -int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
>  int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
> -void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> +int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
>  
>  struct nvkm_gsp_fwif {
>  	int version;
> @@ -52,6 +51,11 @@ struct nvkm_gsp_func {
>  			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
>  	} booter;
>  
> +	struct {
> +		int (*ctor)(struct nvkm_gsp *);
> +		void (*dtor)(struct nvkm_gsp *);
> +	} fwsec_sb;
> +
>  	void (*dtor)(struct nvkm_gsp *);
>  	int (*oneinit)(struct nvkm_gsp *);
>  	int (*init)(struct nvkm_gsp *);
> @@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
>  extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
>  int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
>  			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
> +int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> +void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
>  int tu102_gsp_oneinit(struct nvkm_gsp *);
>  int tu102_gsp_init(struct nvkm_gsp *);
>  int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
> @@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
>  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
>  		  struct nvkm_gsp **);
>  
> +static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +{
> +	if (gsp->func->fwsec_sb.ctor)
> +		return gsp->func->fwsec_sb.ctor(gsp);
> +	return 0;
> +}
> +
> +static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> +{
> +	if (gsp->func->fwsec_sb.dtor)
> +		gsp->func->fwsec_sb.dtor(gsp);
> +}
> +
>  extern const struct nvkm_gsp_func gv100_gsp;
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index 81e56da0474a1..04b642a1f7305 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -30,6 +30,18 @@
>  #include <nvfw/fw.h>
>  #include <nvfw/hs.h>
>  
> +int
> +tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> +{
> +	return nvkm_gsp_fwsec_sb_init(gsp);
> +}
> +
> +void
> +tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> +{
> +	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> +}
> +
>  static int
>  tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
>  {
> @@ -370,6 +382,9 @@ tu102_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> index 97eb046c25d07..58cf258424218 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> @@ -30,6 +30,9 @@ tu116_gsp = {
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> +	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> +	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> +
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,

