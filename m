Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DC2912AB
	for <lists+nouveau@lfdr.de>; Sat, 17 Oct 2020 17:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AAE6E1D6;
	Sat, 17 Oct 2020 15:34:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014BF6EDA8;
 Fri, 16 Oct 2020 11:31:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 786F380735;
 Fri, 16 Oct 2020 13:31:42 +0200 (CEST)
Date: Fri, 16 Oct 2020 13:31:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201016113141.GA1125266@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015123806.32416-10-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=0A2xud3A4b7FAmx5SMIA:9 a=H9YgUdQFGw372Hqm:21
 a=tLNtb35BjFYYr1pq:21 a=CjuIK1q_8ugA:10
X-Mailman-Approved-At: Sat, 17 Oct 2020 15:34:50 +0000
Subject: Re: [Nouveau] [PATCH v4 09/10] dma-buf-map: Add memcpy and
 pointer-increment interfaces
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
Cc: luben.tuikov@amd.com, heiko@sntech.de, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, eric@anholt.net, ray.huang@amd.com, kraxel@redhat.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com, krzk@kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 mripard@kernel.org, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Thomas.

On Thu, Oct 15, 2020 at 02:38:05PM +0200, Thomas Zimmermann wrote:
> To do framebuffer updates, one needs memcpy from system memory and a
> pointer-increment function. Add both interfaces with documentation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/linux/dma-buf-map.h | 72 +++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 2e8bbecb5091..6ca0f304dda2 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -32,6 +32,14 @@
>   * accessing the buffer. Use the returned instance and the helper functions
>   * to access the buffer's memory in the correct way.
>   *
> + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> + * actually independent from the dma-buf infrastructure. When sharing buffers
> + * among devices, drivers have to know the location of the memory to access
> + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> + * solves this problem for dma-buf and its users. If other drivers or
> + * sub-systems require similar functionality, the type could be generalized
> + * and moved to a more prominent header file.
> + *
>   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
>   * considered bad style. Rather then accessing its fields directly, use one
>   * of the provided helper functions, or implement your own. For example,
> @@ -51,6 +59,14 @@
>   *
>   *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>   *
> + * Instances of struct dma_buf_map do not have to be cleaned up, but
> + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> + * always refer to system memory.
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_clear(&map);
> + *
>   * Test if a mapping is valid with either dma_buf_map_is_set() or
>   * dma_buf_map_is_null().
>   *
> @@ -73,17 +89,19 @@
>   *	if (dma_buf_map_is_equal(&sys_map, &io_map))
>   *		// always false
>   *
> - * Instances of struct dma_buf_map do not have to be cleaned up, but
> - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> - * always refer to system memory.
> + * A set up instance of struct dma_buf_map can be used to access or manipulate
> + * the buffer memory. Depending on the location of the memory, the provided
> + * helpers will pick the correct operations. Data can be copied into the memory
> + * with dma_buf_map_memcpy_to(). The address can be manipulated with
> + * dma_buf_map_incr().
>   *
> - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> - * actually independent from the dma-buf infrastructure. When sharing buffers
> - * among devices, drivers have to know the location of the memory to access
> - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> - * solves this problem for dma-buf and its users. If other drivers or
> - * sub-systems require similar functionality, the type could be generalized
> - * and moved to a more prominent header file.
> + * .. code-block:: c
> + *
> + *	const void *src = ...; // source buffer
> + *	size_t len = ...; // length of src
> + *
> + *	dma_buf_map_memcpy_to(&map, src, len);
> + *	dma_buf_map_incr(&map, len); // go to first byte after the memcpy
>   */
>  
>  /**
> @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
>  	}
>  }
>  
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:	The dma-buf mapping structure
> + * @src:	The source buffer
> + * @len:	The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memcpy_toio(dst->vaddr_iomem, src, len);
> +	else
> +		memcpy(dst->vaddr, src, len);

sparc64 needs "#include <linux/string.h>" to build as is does not get
this via io.h

	Sam

> +}
> +
> +/**
> + * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
> + * @map:	The dma-buf mapping structure
> + * @incr:	The number of bytes to increment
> + *
> + * Increments the address stored in a dma-buf mapping. Depending on the
> + * buffer's location, the correct value will be updated.
> + */
> +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> +{
> +	if (map->is_iomem)
> +		map->vaddr_iomem += incr;
> +	else
> +		map->vaddr += incr;
> +}
> +
>  #endif /* __DMA_BUF_MAP_H__ */
> -- 
> 2.28.0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
