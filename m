Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BF7A2A7F
	for <lists+nouveau@lfdr.de>; Sat, 16 Sep 2023 00:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8CC10E6A9;
	Fri, 15 Sep 2023 22:43:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Fri, 15 Sep 2023 22:43:27 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D36B10E6A9
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 22:43:27 +0000 (UTC)
Message-ID: <3e46a803-1ed6-63e7-909e-053cb7425af3@dakr.org>
Date: Sat, 16 Sep 2023 00:34:06 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
References: <20230914084624.2299765-2-skeggsb@gmail.com>
 <20230914084624.2299765-6-skeggsb@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20230914084624.2299765-6-skeggsb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 04/44] drm/nouveau/mmu/gp100-: always
 invalidate TLBs at CACHE_LEVEL_ALL
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/14/23 10:45, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> Fixes some issues when running on top of RM.

Which issues have you seen in particular?

Also, would it make sense to only invalidate TLBs at CACHE_LEVEL_ALL
when actually running on top of RM?

> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> index f3630d0e0d55..bddac77f48f0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> @@ -558,7 +558,7 @@ gp100_vmm_invalidate_pdb(struct nvkm_vmm *vmm, u64 addr)
>   void
>   gp100_vmm_flush(struct nvkm_vmm *vmm, int depth)
>   {
> -	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
> +	u32 type = 0;
>   	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
>   		type |= 0x00000004; /* HUB_ONLY */
>   	type |= 0x00000001; /* PAGE_ALL */
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> index 6cb5eefa45e9..0095d58d4d9a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> @@ -27,7 +27,7 @@ static void
>   tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
>   {
>   	struct nvkm_device *device = vmm->mmu->subdev.device;
> -	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
> +	u32 type = 0;
>   
>   	type |= 0x00000001; /* PAGE_ALL */
>   	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
