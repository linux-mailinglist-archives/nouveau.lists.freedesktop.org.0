Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE457FCC6D
	for <lists+nouveau@lfdr.de>; Wed, 29 Nov 2023 02:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860810E5DB;
	Wed, 29 Nov 2023 01:49:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E11D10E5DB
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 01:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701222561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIu3NMR8ZtfM5MPmtz4GREs7vB3lX1cSTbc6cPC+dy0=;
 b=ZG74jH70Cn+pDkYwlBDsLAcfdLa7dfnYW0AIYvCCwpw84dDJc7lsd3IxYhSGj1LmHfMw0T
 pe3qZI00f75X36brHtfWVlRgxh7mZuTX0iwLgYjWYAUgzNa/oO1CGKkLPbtByJWkUn2Ki6
 1yPZzGsMqSGwrJ+k4Lzjo18DI093xSQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-MUBNtlJWPBSK5lkX8F3Ydg-1; Tue, 28 Nov 2023 20:49:19 -0500
X-MC-Unique: MUBNtlJWPBSK5lkX8F3Ydg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a01c7b09335so499120366b.1
 for <nouveau@lists.freedesktop.org>; Tue, 28 Nov 2023 17:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701222558; x=1701827358;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mIu3NMR8ZtfM5MPmtz4GREs7vB3lX1cSTbc6cPC+dy0=;
 b=jRqzTo+f0lEwZX8E/fA87J5lGxoT5hxne9dh3G24hO8yGyNjGT88a8DiAPk+jalFog
 iCwLy5rgyd1gu+N0ARUbOpPQiVWInQ8NkV6tb9CjtFNPAtpjmbYpVQAsNQCzEYzeKbWp
 UYYdlnBLT5bHOU5zH6uuCbyuZNwG76QM+NOXKwBqec/xe5cGNQ8wOPlAgqd+9MfRGdPL
 WxcKorRGVdXch2XgY0SaERCsnfxtVcRAGyINNuh4LreK+LbU0m0BZDVoGNbf32ODqiT+
 P9F/JfGfJgWx5+ywmTOUmxv2aEfM+gKl47qV1Zpa5QIAIFqJhz+a/Yl9bwciwHmTTPGQ
 GKBA==
X-Gm-Message-State: AOJu0YzqxHTM4GgM2JNUH1CG6Yw5o1053k5WZsFnMT3BaJc3rYPZgWaW
 fSIW4/7QOOPgDaHDnng+QxS5mVjvHi48yi9SQ1hSGJ5MTSEqfZt2G28Gw1EQAJXHU754KMq+j6y
 OjDWNSCWmG51h0i2ohHzU+NrE4A==
X-Received: by 2002:a17:906:1f02:b0:9ff:a532:b122 with SMTP id
 w2-20020a1709061f0200b009ffa532b122mr10885667ejj.7.1701222558611; 
 Tue, 28 Nov 2023 17:49:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJWMGPGHAHx9e6Mvhz5+OI24qVIix99xkb1rFfyQy4WPwmQiYg5e2J0BspRpWxef5PY3G1LQ==
X-Received: by 2002:a17:906:1f02:b0:9ff:a532:b122 with SMTP id
 w2-20020a1709061f0200b009ffa532b122mr10885659ejj.7.1701222558184; 
 Tue, 28 Nov 2023 17:49:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090626c300b009a5f1d15644sm7309588ejc.119.2023.11.28.17.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 17:49:17 -0800 (PST)
Message-ID: <eef22f2a-3c25-4895-9130-5076c85d1a03@redhat.com>
Date: Wed, 29 Nov 2023 02:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
References: <20231122202840.2565153-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231122202840.2565153-1-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] [v2] nouveau/gsp: document some aspects of
 GSP-RM
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

thanks a lot for documenting this!

One comment below.

On 11/22/23 21:28, Timur Tabi wrote:
> Document a few aspects of communication with GSP-RM.  These comments
> are derived from notes made during early development of GSP-RM
> support in Nouveau, but were not included in the initial patch set.
> 
> Reviewed-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   .../common/shared/msgq/inc/msgq/msgq_priv.h   | 69 ++++++++++++++--
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 82 +++++++++++++++++++
>   2 files changed, 142 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
> index 5a2f273d95c8..45f0cbe430f9 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
> @@ -26,21 +26,72 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +/**
> + * msgqTxHeader -- TX queue data structure
> + * @version: the version of this structure, must be 0
> + * @size: the size of the entire queue, including this header
> + * @msgSize: the padded size of queue element, 16 is minimum
> + * @msgCount: the number of elements in this queue
> + * @writePtr: head index of this queue
> + * @flags: 1 = swap the RX pointers
> + * @rxHdrOff: offset of readPtr in this structure
> + * @entryOff: offset of beginning of queue (msgqRxHeader), relative to
> + *          beginning of this structure
> + *
> + * The command queue is a queue of RPCs that are sent from the driver to the
> + * GSP.  The status queue is a queue of messages/responses from GSP-RM to the
> + * driver.  Although the driver allocates memory for both queues, the command
> + * queue is owned by the driver and the status queue is owned by GSP-RM.  In
> + * addition, the headers of the two queues must not share the same 4K page.
> + *
> + * Each queue is prefixed with this data structure.  The idea is that a queue
> + * and its header are written to only by their owner.  That is, only the
> + * driver writes to the command queue and command queue header, and only the
> + * GSP writes to the status (receive) queue and its header.
> + *
> + * This is enforced by the concept of "swapping" the RX pointers.  This is
> + * why the 'flags' field must be set to 1.  'rxHdrOff' is how the GSP knows
> + * where the where the tail pointer of its status queue.
> + *
> + * When the driver writes a new RPC to the command queue, it updates writePtr.
> + * When it reads a new message from the status queue, it updates readPtr.  In
> + * this way, the GSP knows when a new command is in the queue (it polls
> + * writePtr) and it knows how much free space is in the status queue (it
> + * checks readPtr).  The driver never cares about how much free space is in
> + * the status queue.
> + *
> + * As usual, producers write to the head pointer, and consumers read from the
> + * tail pointer.  When head == tail, the queue is empty.
> + *
> + * So to summarize:
> + * command.writePtr = head of command queue
> + * command.readPtr = tail of status queue
> + * status.writePtr = head of status queue
> + * status.readPtr = tail of command queue
> + */
>   typedef struct
>   {
> -    NvU32 version;   // queue version
> -    NvU32 size;      // bytes, page aligned
> -    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is minimum
> -    NvU32 msgCount;  // number of entries in queue
> -    NvU32 writePtr;  // message id of next slot
> -    NvU32 flags;     // if set it means "i want to swap RX"
> -    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing store.
> -    NvU32 entryOff;  // Offset of entries from start of backing store.

Maybe we should just leave those and the ones below alone. The less we change, the
less we can mess up applying those patches to new header files, in case we ever
need to. In this case I could think of missing a newly introduced padding or
something. Maybe a bit paranoid though. :-)

Let me know what you think, I can also change it when applying the patch.

Either way,

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> +	NvU32 version;
> +	NvU32 size;
> +	NvU32 msgSize;
> +	NvU32 msgCount;
> +	NvU32 writePtr;
> +	NvU32 flags;
> +	NvU32 rxHdrOff;
> +	NvU32 entryOff;
>   } msgqTxHeader;
>   
> +/**
> + * msgqRxHeader - RX queue data structure
> + * @readPtr: tail index of the other queue
> + *
> + * Although this is a separate struct, it could easily be merged into
> + * msgqTxHeader.  msgqTxHeader.rxHdrOff is simply the offset of readPtr
> + * from the beginning of msgqTxHeader.
> + */
>   typedef struct
>   {
> -    NvU32 readPtr; // message id of last message read
> +	NvU32 readPtr;
>   } msgqRxHeader;
>   
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index dc44f5c7833f..4eca81cff1ba 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1379,6 +1379,13 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
>   	return 0;
>   }
>   
> +/**
> + * r535_gsp_msg_run_cpu_sequencer() -- process I/O commands from the GSP
> + *
> + * The GSP sequencer is a list of I/O commands that the GSP can send to
> + * the driver to perform for various purposes.  The most common usage is to
> + * perform a special mid-initialization reset.
> + */
>   static int
>   r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
>   {
> @@ -1718,6 +1725,23 @@ r535_gsp_libos_id8(const char *name)
>   	return id;
>   }
>   
> +/**
> + * create_pte_array() - creates a PTE array of a physically contiguous buffer
> + * @ptes: pointer to the array
> + * @addr: base address of physically contiguous buffer (GSP_PAGE_SIZE aligned)
> + * @size: size of the buffer
> + *
> + * GSP-RM sometimes expects physically-contiguous buffers to have an array of
> + * "PTEs" for each page in that buffer.  Although in theory that allows for
> + * the buffer to be physically discontiguous, GSP-RM does not currently
> + * support that.
> + *
> + * In this case, the PTEs are DMA addresses of each page of the buffer.  Since
> + * the buffer is physically contiguous, calculating all the PTEs is simple
> + * math.
> + *
> + * See memdescGetPhysAddrsForGpu()
> + */
>   static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>   {
>   	unsigned int num_pages = DIV_ROUND_UP_ULL(size, GSP_PAGE_SIZE);
> @@ -1727,6 +1751,35 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>   		ptes[i] = (u64)addr + (i << GSP_PAGE_SHIFT);
>   }
>   
> +/**
> + * r535_gsp_libos_init() -- create the libos arguments structure
> + *
> + * The logging buffers are byte queues that contain encoded printf-like
> + * messages from GSP-RM.  They need to be decoded by a special application
> + * that can parse the buffers.
> + *
> + * The 'loginit' buffer contains logs from early GSP-RM init and
> + * exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
> + * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
> + *
> + * The physical address map for the log buffer is stored in the buffer
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + *
> + * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
> + * configured for a larger page size (e.g. 64K pages), we need to give
> + * the GSP an array of 4K pages. Fortunately, since the buffer is
> + * physically contiguous, it's simple math to calculate the addresses.
> + *
> + * The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
> + * ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
> + * buffers to be physically contiguous anyway.
> + *
> + * The memory allocated for the arguments must remain until the GSP sends the
> + * init_done RPC.
> + *
> + * See _kgspInitLibosLoggingStructures (allocates memory for buffers)
> + * See kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
> + */
>   static int
>   r535_gsp_libos_init(struct nvkm_gsp *gsp)
>   {
> @@ -1837,6 +1890,35 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
>   		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
>   }
>   
> +/**
> + * nvkm_gsp_radix3_sg - build a radix3 table from a S/G list
> + *
> + * The GSP uses a three-level page table, called radix3, to map the firmware.
> + * Each 64-bit "pointer" in the table is either the bus address of an entry in
> + * the next table (for levels 0 and 1) or the bus address of the next page in
> + * the GSP firmware image itself.
> + *
> + * Level 0 contains a single entry in one page that points to the first page
> + * of level 1.
> + *
> + * Level 1, since it's also only one page in size, contains up to 512 entries,
> + * one for each page in Level 2.
> + *
> + * Level 2 can be up to 512 pages in size, and each of those entries points to
> + * the next page of the firmware image.  Since there can be up to 512*512
> + * pages, that limits the size of the firmware to 512*512*GSP_PAGE_SIZE = 1GB.
> + *
> + * Internally, the GSP has its window into system memory, but the base
> + * physical address of the aperture is not 0.  In fact, it varies depending on
> + * the GPU architecture.  Since the GPU is a PCI device, this window is
> + * accessed via DMA and is therefore bound by IOMMU translation.  The end
> + * result is that GSP-RM must translate the bus addresses in the table to GSP
> + * physical addresses.  All this should happen transparently.
> + *
> + * Returns 0 on success, or negative error code
> + *
> + * See kgspCreateRadix3_IMPL
> + */
>   static int
>   nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64 size,
>   		   struct nvkm_gsp_radix3 *rx3)

