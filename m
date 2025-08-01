Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB6B17EBB
	for <lists+nouveau@lfdr.de>; Fri,  1 Aug 2025 11:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF6B10E809;
	Fri,  1 Aug 2025 09:01:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D613810E809
 for <nouveau@lists.freedesktop.org>; Fri,  1 Aug 2025 09:01:47 +0000 (UTC)
Message-ID: <407cb766-fef5-4d86-84c4-a6e6eaf25bdb@dakr.org>
Date: Fri, 1 Aug 2025 11:01:45 +0200
MIME-Version: 1.0
Subject: Re: [RESEND][PATCH] drm/nouveau: remove unused increment in
 gm200_flcn_pio_imem_wr
To: Timur Tabi <ttabi@nvidia.com>
References: <20250725221717.671983-1-ttabi@nvidia.com>
From: Danilo Krummrich <kernel@dakr.org>
Cc: nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250725221717.671983-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Timur,

Please Cc the relevant maintainers when sending patches.

On 7/26/25 12:17 AM, Timur Tabi wrote:
> The 'tag' parameter is passed by value and is not actually used after
> being incremented, so remove the increment.

Good catch, but the commit message should also mention that the "actual"
increment is in nvkm_falcon_pio_wr(), otherwise it throws up the question if the
increment is missing somewhere else instead.

> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> index f0acfaa153d1..7c43397c19e6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
> @@ -103,7 +103,7 @@ gm200_flcn_pio_imem_wr_init(struct nvkm_falcon *falcon, u8 port, bool sec, u32 i
>   static void
>   gm200_flcn_pio_imem_wr(struct nvkm_falcon *falcon, u8 port, const u8 *img, int len, u16 tag)
>   {
> -	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag++);
> +	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag);
>   	while (len >= 4) {
>   		nvkm_falcon_wr32(falcon, 0x184 + (port * 0x10), *(u32 *)img);
>   		img += 4;
> 
> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0

