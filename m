Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D97F3ADA
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 01:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A543E10E5C0;
	Wed, 22 Nov 2023 00:52:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D510E5C0
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 00:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700614343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7laoJg9Xp8AklvG70yxYljtwxtLOkLS57rqSL5LIl0s=;
 b=hLNNiPXBqmNbUbO+6LMuuryYMHEW99xRjJJQ/FA2U7mesQ2d0EjXr6cdH2fwHkeGwA/X84
 uPu5HiTKJnKYggVev74nwlL+Dn0jo5wSLeGUVKgnhJM5CHfK4oZBvSIbDaXAEFav7OgM6B
 8rwqFvCBuH6uz7siFRzAD/Ja6G06YQw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-M-MPfDXuPCyImRcNBNBW4Q-1; Tue, 21 Nov 2023 19:52:20 -0500
X-MC-Unique: M-MPfDXuPCyImRcNBNBW4Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-421b4bc2a80so75064271cf.3
 for <nouveau@lists.freedesktop.org>; Tue, 21 Nov 2023 16:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700614340; x=1701219140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7laoJg9Xp8AklvG70yxYljtwxtLOkLS57rqSL5LIl0s=;
 b=U2LdXE/XKSQMfZOyTNE7VzOgcxFxlLvIyQxU0uz2IPSgKWqnyavcGFmp4DSjfnycT5
 PvWnV486nXW8rM7BOi0NRTJLRhOAhCv6Tb8z7eYnovFs0pjCTwuCpLodoa5CLyI90ZHA
 2KLkSj3WKnlCFGyL7n+sMPfhJGifLC4yUlL3cJC1wo0AJ5dvVq3dL6NMFKYsPDTNHNTH
 Ezpzy19xYon/91cVIFxql+P1i8tNUz/NNRqYcvpOf+dUeR9tXYUsIHL8103kT9+AtFTZ
 /gqqlx5eIivyyOfHDKHiL9R2JFF2cz5sABtRI4GYV8q60k/jKSEOIuAo7Gg2wSeCr1xp
 lTUw==
X-Gm-Message-State: AOJu0YwltvwDpHDtaHYhTFG2OY3L2ucOdxsSh92hKHNY/73vWIyku4H6
 UDeuT+qarLTZ1wJhRI6gRojbqXS7nOTKmgDdT0+hKJxkVxyJMHOrOPajZHk0Gw0mHM19Ui1F7K2
 nN6LINez0azK5vugonalPr/5HkqCQX3D4QNYb4l40xg==
X-Received: by 2002:ac8:4cdc:0:b0:423:7d72:6c8 with SMTP id
 l28-20020ac84cdc000000b004237d7206c8mr180289qtv.53.1700614339674; 
 Tue, 21 Nov 2023 16:52:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTvd1khL9EBXRoBQIOsb7atvt3hejstP2DbWO8f/Mp9BhkMoN3CSLE5BQdAObd9F78nXh+J7DVGx/k1IMYLLg=
X-Received: by 2002:ac8:4cdc:0:b0:423:7d72:6c8 with SMTP id
 l28-20020ac84cdc000000b004237d7206c8mr180279qtv.53.1700614339375; Tue, 21 Nov
 2023 16:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20231121235300.2406522-1-ttabi@nvidia.com>
In-Reply-To: <20231121235300.2406522-1-ttabi@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 22 Nov 2023 10:52:08 +1000
Message-ID: <CAMwc25oK9xXoNW0z8A7=O+tRqUvcxAKy4rfUAzAOjOgESVhj2Q@mail.gmail.com>
To: Timur Tabi <ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: document some aspects of GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 9:53=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Document a few aspects of communication with GSP-RM.  These comments
> are derived from notes made during early development of GSP-RM
> support in Nouveau, but were not included in the initial patch set.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  .../common/shared/msgq/inc/msgq/msgq_priv.h   | 79 +++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 86 ++++++++++++++++++-
>  2 files changed, 154 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/share=
d/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.=
01/common/shared/msgq/inc/msgq/msgq_priv.h
> index 5a2f273d95c8..1e94bf087b23 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/=
inc/msgq/msgq_priv.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/=
inc/msgq/msgq_priv.h
> @@ -26,21 +26,82 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +#define GSP_MESSAGE_COMMAND_QUEUE_SIZE 0x40000
> +#define GSP_MESSAGE_STATUS_QUEUE_SIZE  0x40000
> +
> +/**
> + * msgqTxHeader -- TX queue data structure
> + * @version: the version of this structure, must be 0
> + * @size: the size of the entire queue, including this header
> + * @msgSize: the padded size of queue element, must be power-of-2, 16 is
> + *         minimum

I don't think this is true anymore, I think 4k is the minimum size
since one of the 535 series.


> + * @msgCount: the number of elements in this queue
> + * @writePtr: head index of this queue
> + * @flags: 1 =3D swap the RX pointers
> + * @rxHdrOff: offset of readPtr in this structure
> + * @entryOff: offset of beginning of queue (msgqRxHeader), relative to
> + *          beginning of this structure
> + *
> + * The command queue is a queue of RPCs that are sent from the driver to=
 the
> + * GSP.  The status queue is a queue of messages/responses from the GSP =
to the
> + * driver.  Although the driver allocates memory for both queues (inside=
 the
> + * same memory block), the command queue is owned by the driver and the =
status
> + * queue is owned by the GSP.  In addition, the two headers must not sha=
re the
> + * same 4K page.
> + *
> + * Unfortunately, depsite the fact that the queue size is a field in thi=
s

^ typo

> + * structure, the GSP has a hard-coded expectation of the sizes.  So the
> + * command queue size must be GSP_MESSAGE_COMMAND_QUEUE_SIZE and the sta=
tus
> + * queue size must be GSP_MESSAGE_STATUS_QUEUE_SIZE.
> + *
> + * Each queue is prefixed with this data structure.  The idea is that a =
queue
> + * and its header are written to only by their owner.  That is, only the
> + * driver writes to the command queue and command queue header, and only=
 the
> + * GSP writes to the status (receive) queue and its header.
> + *
> + * This is enforced by the concept of "swapping" the RX pointers.  This =
is
> + * why the 'flags' field must be set to 1.  'rxHdrOff' is how the GSP kn=
ows
> + * where the where the tail pointer of its status queue.
> + *
> + * When the driver writes a new RPC to the command queue, it updates wri=
tePtr.
> + * When it reads a new message from the status queue, it updates readPtr=
.  In
> + * this way, the GSP knows when a new command is in the queue (it polls
> + * writePtr) and it knows how much free space is in the status queue (it
> + * checks readPtr).  The driver never cares about how much free space is=
 in
> + * the status queue.
> + *
> + * As usual, producers write to the head pointer, and consumers read fro=
m the
> + * tail pointer.  When head =3D=3D tail, the queue is empty.
> + *
> + * So to summarize:
> + * command.writePtr =3D head of command queue
> + * command.readPtr =3D tail of status queue
> + * status.writePtr =3D head of status queue
> + * status.readPtr =3D tail of command queue
> + */
>  typedef struct
>  {
> -    NvU32 version;   // queue version
> -    NvU32 size;      // bytes, page aligned
> -    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is min=
imum
> -    NvU32 msgCount;  // number of entries in queue
> -    NvU32 writePtr;  // message id of next slot
> -    NvU32 flags;     // if set it means "i want to swap RX"
> -    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing sto=
re.
> -    NvU32 entryOff;  // Offset of entries from start of backing store.
> +       NvU32 version;
> +       NvU32 size;
> +       NvU32 msgSize;
> +       NvU32 msgCount;
> +       NvU32 writePtr;
> +       NvU32 flags;
> +       NvU32 rxHdrOff;
> +       NvU32 entryOff;
>  } msgqTxHeader;
>
> +/**
> + * msgqRxHeader - RX queue data structure
> + * @readPtr: tail index of the other queue
> + *
> + * Although this is a separate struct, it could easily be merged into
> + * msgqTxHeader.  msgqTxHeader.rxHdrOff is simply the offset of readPtr
> + * from the beginning of msgqTxHeader.
> + */
>  typedef struct
>  {
> -    NvU32 readPtr; // message id of last message read
> +       NvU32 readPtr;
>  } msgqRxHeader;
>
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index dc44f5c7833f..265c0a413ea8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1379,6 +1379,13 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *=
repv, u32 repc)
>         return 0;
>  }
>
> +/**
> + * r535_gsp_msg_run_cpu_sequencer() -- process I/O commands from the GSP
> + *
> + * The GSP sequencer is a list of I/O commands that the GSP can send to
> + * the driver to perform for various purposes.  The most common usage is=
 to
> + * perform a special mid-initialization reset.
> + */
>  static int
>  r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
>  {
> @@ -1628,8 +1635,8 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
>         } *cmdq, *msgq;
>         int ret, i;
>
> -       gsp->shm.cmdq.size =3D 0x40000;
> -       gsp->shm.msgq.size =3D 0x40000;
> +       gsp->shm.cmdq.size =3D GSP_MESSAGE_COMMAND_QUEUE_SIZE;
> +       gsp->shm.msgq.size =3D GSP_MESSAGE_STATUS_QUEUE_SIZE;
>
>         gsp->shm.ptes.nr  =3D (gsp->shm.cmdq.size + gsp->shm.msgq.size) >=
> GSP_PAGE_SHIFT;
>         gsp->shm.ptes.nr +=3D DIV_ROUND_UP(gsp->shm.ptes.nr * sizeof(u64)=
, GSP_PAGE_SIZE);
> @@ -1718,6 +1725,23 @@ r535_gsp_libos_id8(const char *name)
>         return id;
>  }
>
> +/**
> + * create_pte_array() - creates a PTE array of a physically contiguous b=
uffer
> + * @ptes: pointer to the array
> + * @addr: base address of physically contiguous buffer (GSP_PAGE_SIZE al=
igned)
> + * @size: size of the buffer
> + *
> + * GSP-RM sometimes expects physically-contiguous buffers to have an arr=
ay of
> + * "PTEs" for each page in that buffer.  Although in theory that allows =
for
> + * the buffer to be physically discontiguous, GSP-RM does not currently
> + * support that.
> + *
> + * In this case, the PTEs are DMA addresses of each page of the buffer. =
 Since
> + * the buffer is physically contiguous, calculating all the PTEs is simp=
le
> + * math.
> + *
> + * See memdescGetPhysAddrsForGpu()
> + */
>  static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>  {
>         unsigned int num_pages =3D DIV_ROUND_UP_ULL(size, GSP_PAGE_SIZE);
> @@ -1727,6 +1751,35 @@ static void create_pte_array(u64 *ptes, dma_addr_t=
 addr, size_t size)
>                 ptes[i] =3D (u64)addr + (i << GSP_PAGE_SHIFT);
>  }
>
> +/**
> + * r535_gsp_libos_init() -- create the libos arguments structure
> + *
> + * The logging buffers are byte queues that contain encoded printf-like
> + * messages from GSP-RM.  They need to be decoded by a special applicati=
on
> + * that can parse the buffers.
> + *
> + * The 'loginit' buffer contains logs from early GSP-RM init and
> + * exception dumps.  The 'logrm' buffer contains the subsequent logs. Bo=
th are
> + * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZ=
E.
> + *
> + * The physical address map for the log buffer is stored in the buffer
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + *
> + * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the ker=
nel is
> + * configured for a larger page size (e.g. 64K pages), we need to give
> + * the GSP an array of 4K pages. Fortunately, since the buffer is
> + * physically contiguous, it's simple math to calculate the addresses.
> + *
> + * The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also current=
ly
> + * ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects =
the
> + * buffers to be physically contiguous anyway.
> + *
> + * The memory allocated for the arguments must remain until the GSP send=
s the
> + * init_done RPC.
> + *
> + * See _kgspInitLibosLoggingStructures (allocates memory for buffers)
> + * See kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
> + */
>  static int
>  r535_gsp_libos_init(struct nvkm_gsp *gsp)
>  {
> @@ -1837,6 +1890,35 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct =
nvkm_gsp_radix3 *rx3)
>                 nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
>  }
>
> +/**
> + * nvkm_gsp_radix3_sg - build a radix3 table from a S/G list
> + *
> + * The GSP uses a three-level page table, called radix3, to map the firm=
ware.
> + * Each 64-bit "pointer" in the table is either the bus address of an en=
try in
> + * the next table (for levels 0 and 1) or the bus address of the next pa=
ge in
> + * the GSP firmware image itself.
> + *
> + * Level 0 contains a single entry in one page that points to the first =
page
> + * of level 1.
> + *
> + * Level 1, since it's also only one page in size, contains up to 512 en=
tries,
> + * one for each page in Level 2.
> + *
> + * Level 2 can be up to 512 pages in size, and each of those entries poi=
nts to
> + * the next page of the firmware image.  Since there can be up to 512*51=
2
> + * pages, that limits the size of the firmware to 512*512*GSP_PAGE_SIZE =
=3D 1GB.
> + *
> + * Internally, the GSP has its window into system memory, but the base
> + * physical address of the aperture is not 0.  In fact, it varies depend=
ing on
> + * the GPU architure.  Since the GPU is a PCI device, this window is acc=
essed

^ typo

> + * via DMA and is therefore bound by IOMMU translation.  The end result =
is
> + * that GSP-RM must translate the bus addresses in the table to GSP phys=
ical
> + * addresses.  All this should happen transparently.
> + *
> + * Returns 0 on success, or negative error code
> + *
> + * See kgspCreateRadix3_IMPL
> + */
>  static int
>  nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64=
 size,
>

Otherwise seems fine, with those fixed feel free to resend and add

a Reviewed-by: Dave Airlie <airlied@redhat.com> tag.

Dave.

