Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1949A2F12
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 22:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7310E091;
	Thu, 17 Oct 2024 20:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="od/q5QUb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCF010E091
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 20:53:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21814A43927;
 Thu, 17 Oct 2024 20:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558BC4CEC3;
 Thu, 17 Oct 2024 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729198386;
 bh=X1d5IbCjlezc5/XS1hLYZpKk3fUbYj+TnHPu4e7V3m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=od/q5QUbCXHLyNemGjYEc8geL+RrU58br4ZnD4GPx92X3ZSKy7gzA8v6FV+e83Qwh
 TyCjjVQ+E9N+xYN8NtmJwixQHPLA+hO8qmU30Ri0ctQ0ZtS3GjL9vRNWc/3AwwILHY
 jzhi4RcwHHtxLnvJa9CuHUJGGSemaUh+YfKeh9yPILyeLdA5MnEv+Pg0ng6ztJHPBH
 HYRWLil2BhGBXAILfZMzhHKhUTp+1jKiGYzAPioO5Ya4xRXKLjM8q12Eev+Zwwaljn
 Y9CxatE+YytFwbb/GREycnbtVkihI4MDeG4Ra5vPau60j65wZpqJzUujv9oxvIdhln
 7dDTbszBdKmKw==
Date: Thu, 17 Oct 2024 22:53:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH 3/3] nvkm: handle the return of large RPC
Message-ID: <ZxF5LNa8ciz1MNmK@cassiopeiae>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
 <20241017071922.2518724-4-zhiw@nvidia.com>
 <ZxD1BBUUeLQdvXVX@pollux>
 <02190350-b006-4ead-af11-8eb69b3f3ca2@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02190350-b006-4ead-af11-8eb69b3f3ca2@nvidia.com>
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

On Thu, Oct 17, 2024 at 07:50:24PM +0000, Zhi Wang wrote:
> On 17/10/2024 14.29, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> 
> Hi Danilo:
> 
> Thanks for the reply. See my comments below. If there is no more comment 
> on PATCH 1/2, I would like to send a seperate series for large RPC 
> support in msgq (PATCH 3) in the next spin.

Sounds good, I'll apply patch 1 and 2 tomorrow then.

Please make sure to still send the "new" series as v3.

> 
> > On Thu, Oct 17, 2024 at 12:19:22AM -0700, Zhi Wang wrote:
> >> The max RPC size is 16 pages (including the RPC header). To send an RPC
> >> larger than 16 pages, nvkm should split it into multiple RPCs and send
> >> it accordingly. The first of the split RPCs has the expected function
> >> number, while the rest of the split RPCs are sent with function number
> >> as NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD. GSP will consume the split
> >> RPCs from the cmdq and always write the result back to the msgq. The
> >> result is also formed as split RPCs.
> >>
> >> However, NVKM is able to send split RPC when dealing with large RPCs,
> >> but totally not aware of handling the return of the large RPCs, which
> >> are the split RPC in the msgq. Thus, it keeps dumping the unknown RPC
> >> messages from msgq, which is actually CONTINUATION_RECORD message,
> >> discard them unexpectly. Thus, the caller will not be able to consume
> >> the result from GSP.
> >>
> >> Introduce the handling of split RPCs on the msgq path. Slightly
> >> re-factor the low-level part of receiving RPCs from the msgq, RPC
> >> vehicle handling to merge the split RPCs back into a large RPC before
> >> handling it to the upper level. Thus, the upper-level of RPC APIs don't
> >> need to be heavily changed.
> >>
> >> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> >> ---
> >>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 237 +++++++++++++-----
> >>   1 file changed, 177 insertions(+), 60 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> index 50ae56013344..9c422644c9e7 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> @@ -72,6 +72,21 @@ struct r535_gsp_msg {
> >>
> >>   #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
> >>
> >> +struct nvfw_gsp_rpc {
> >> +     u32 header_version;
> >> +     u32 signature;
> >> +     u32 length;
> >> +     u32 function;
> >> +     u32 rpc_result;
> >> +     u32 rpc_result_private;
> >> +     u32 sequence;
> >> +     union {
> >> +             u32 spare;
> >> +             u32 cpuRmGfid;
> >> +     };
> >> +     u8  data[];
> >> +};
> >> +
> >>   static int
> >>   r535_rpc_status_to_errno(uint32_t rpc_status)
> >>   {
> >> @@ -86,16 +101,34 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
> >>        }
> >>   }
> >>
> >> +struct gsp_msgq_recv_args {
> > 
> > Since we're adding the necessary documentation to this structure please make
> > them proper kernel doc comments [1].
> > 
> > Please also make sure to explain things a bit more in detail.
> > 
> > For you NVIDIA folks it's likely way easier to understand the code, since you
> > probably have existing documentation of the GSP interface, are involved in the
> > design of the interface in the first place, etc.
> > 
> Oops. What I can only say is (:p) : I learned almost all the knowledge 
> of GSP procotols from GSP RPC operation code in OpenRM [1] and Ben's GSP 
> enabling patches [2] plus learning in debug.
> 
> I can write a doc based on my notes and ask some one can help on review.

I'm not asking you to write a full doc (even though it would be very appreciated
:p), but I really would like to get everything we keep changing to a point where
new people are able to get a grasp of what's going on with reasonable effort.

> 
> [1] 
> https://github.com/NVIDIA/open-gpu-kernel-modules/blob/ed4be649623435ebb04f5e93f859bf46d977daa4/src/nvidia/src/kernel/gpu/gsp/message_queue_cpu.c#L4
> 
> [2] 
> https://lore.kernel.org/nouveau/CAPM=9tyW=YuDQrRwrYK_ayuvEnp+9irTuze=MP-zkowm3CFJ9A@mail.gmail.com/T/
> 
> > Try to think about what's necessary for new people joining the project to
> > understand the code.
> > 
> 
> When writting v2, I was thinking if it would be better to just chop this 
> wait functions into several. It actually contains several functions now:
> 
> - wait
> - wait for the GSP message header when peek the msgq.
> - wait for the complete GSP message there can copy it into the vehicle.
> 	- skip the RPC header for continuation message.
> 	- non skip the RPC header for ordinary messages.

Indeed -- that's what I had in mind too when I said that r535_gsp_msgq_wait()
has quite some more semantics than what the name implies and that we should
"build a properly documented state machine around it".

> 
> > [1] https://docs.kernel.org/doc-guide/kernel-doc.html
> > 
> >> +     /* timeout in us */
> >> +     int time;
> > 
> > This is misleading, it's not really the time, but the number of sleep cycles.
> > It's just that the current cycle is set to usleep_range(1, 2).
> > 
> > Maybe we want to name it "retries", "retry_count", or just "retry" instead?
> > 
> > Besides that, do you see a need to continuously decrease the retry count at all?
> > 
> > To me it looks like we could just make it a constant and let the function that
> > needs the retry loop deal with it internally instead of passing it around
> > everywhere. Do I miss anything?
> > 
> 
> Totally agree.

Great, then let's get this simplified.

> 
> >> +     /* if set, peek the msgq, otherwise copy it */
> >> +     u32 *prepc;
> > 
> > This sounds like if `prepc` would be a bool. Please add a description that
> > properly explains what the field actually represents.
> > 
> 
> According to what I understand, prepc represents the actual message 
> length when peeking the msgq. (first, wait for the GSP RPC message 
> header to be there, then passing the actual GSP RPC message length to 
> the caller.)
> 
> >> +     /*
> >> +      * the size (without message header) of message to
> >> +      * wait(when peek)/copy from the msgq
> >> +      */
> >> +     u32 repc;
> > 
> > Since the term "repc" is used everywhere in this file, but is never explained,
> > maybe this would be a good place?
> > 
> 
> It would be nice to refine repc, argc and argv, since they were quite 
> confusing to me when I ramped up nouveau code.

Fully agree, I think they are indeed confusing. I think within this file those
arguments are never that generic such that we can't come up with a more
descriptive and defined naming scheme.

> 
> > Do we know what it means? I mean, the semantics in this context is clear, but
> > otherwise it looks like some generic term like "argc"?
> > 
> > Otherwise, feel free to replace it with a less generic and more meaningful name.
> > ()
> >> +     /* the message buffer */
> >> +     u8 *msg;
> > 
> > Please expand this a bit; the following questions might help:
> >    - What kind of message?
> >    - Is it always the same kind of message?
> >    - Who is supposed to allocate it?
> >    - How does it get freed?
> > 
> 
> I think this will look clearer if we chopped the function into several.

Agreed!

> 
> Back to the questions:
> 
> - What kind of message?
> GSP RPC message without message header
> 
> - Is it always the same kind of message?
> Yes
> 
> - Who is supposed to allocate it?
> r535_gsp_msgq_recv().
> 
> - How does it get freed?
> nvkm_gsp_rpc_done().
> 
> An example of lifecycle of RPC vehicle can be found in 
> r535_gsp_rpc_rm_alloc_push().

I'm aware. :) I asked those questions, because I think the answers for those
should be made obvious to the reader of the code. Ideally, through both, design
and documentation.

> 
> >> +     /*
> >> +      * skip copying the rpc header, used when handling a large RPC.
> >> +      * rpc header only shows up in the first segment of a large RPC.
> >> +      */
> >> +     bool skip_copy_rpc_header;
> >> +};
> >> +
> >>   static void *
> >> -r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
> >> +gsp_msgq_recv(struct nvkm_gsp *gsp, struct gsp_msgq_recv_args *args)
> > 
> > For static functions it's probably fine to omit the "r535" prefix, but since
> > it's been used everywhere else, we may want to keep it for consistency.
> > 
> 
> Was thinking about this. Was it a good idea to have the version number 
> in the function name everywhere?

For the public ones they have to be, since we somehow need to deal with multiple
firmware versions.

For the private ones, it's probably nice to have too, because otherwise it may
be annoying to grep for things specific to a given firmware version.

> 
> > Also please add a proper kernel doc comment to this function explaining its
> > semantics as well.
> > 
> Sure.
> >>   {
> >>        struct r535_gsp_msg *mqe;
> >> -     u32 size, rptr = *gsp->msgq.rptr;
> >> +     u32 rptr = *gsp->msgq.rptr;
> >>        int used;
> >> -     u8 *msg;
> >> -     u32 len;
> >> +     u32 size, len, repc;
> >>
> >> -     size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
> >> +     size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + args->repc, GSP_PAGE_SIZE);
> >>        if (WARN_ON(!size || size >= gsp->msgq.cnt))
> >>                return ERR_PTR(-EINVAL);
> >>
> >> @@ -109,46 +142,149 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
> >>                        break;
> >>
> >>                usleep_range(1, 2);
> >> -     } while (--(*ptime));
> >> +     } while (--(args->time));
> >>
> >> -     if (WARN_ON(!*ptime))
> >> +     if (WARN_ON(!args->time))
> >>                return ERR_PTR(-ETIMEDOUT);
> >>
> >>        mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
> >>
> >> -     if (prepc) {
> >> -             *prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
> >> +     if (args->prepc) {
> >> +             *args->prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
> >>                return mqe->data;
> >>        }
> >>
> >> +     repc = args->repc;
> >>        size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
> >>
> >> -     msg = kvmalloc(repc, GFP_KERNEL);
> >> -     if (!msg)
> >> -             return ERR_PTR(-ENOMEM);
> >> -
> >>        len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
> >>        len = min_t(u32, repc, len);
> >> -     memcpy(msg, mqe->data, len);
> >> +     if (!args->skip_copy_rpc_header)
> >> +             memcpy(args->msg, mqe->data, len);
> >> +     else
> >> +             memcpy(args->msg, mqe->data + sizeof(struct nvfw_gsp_rpc),
> >> +                    len - sizeof(struct nvfw_gsp_rpc));
> >>
> >>        repc -= len;
> >>
> >>        if (repc) {
> >>                mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
> >> -             memcpy(msg + len, mqe, repc);
> >> +             memcpy(args->msg + len, mqe, repc);
> >>        }
> >>
> >>        rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
> >>
> >>        mb();
> >>        (*gsp->msgq.rptr) = rptr;
> >> -     return msg;
> >> +     return args->msg;
> >> +}
> >> +
> >> +static void
> >> +r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
> >> +{
> >> +     if (gsp->subdev.debug >= lvl) {
> >> +             nvkm_printk__(&gsp->subdev, lvl, info,
> >> +                           "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
> >> +                           msg->function, msg->length, msg->length - sizeof(*msg),
> >> +                           msg->rpc_result, msg->rpc_result_private);
> >> +             print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
> >> +                            msg->data, msg->length - sizeof(*msg), true);
> >> +     }
> >> +}
> >> +
> >> +static void *
> >> +r535_gsp_msgq_recv_continuation(struct nvkm_gsp *gsp, u32 *payload_size,
> >> +                             u8 *buf, int time)
> > 
> > This looks like a great place to add an explanation about continuation records.
> > 
> > Someone who wants to join the project likely has no idea about RPCs and
> > continuation records.
> > 
> > Please add some documentation explaining what continuation records are, when
> > they are expected to be sent and what this function does to deal with them.
> > 
> 
> Sure.
> 
> >> +{
> >> +     struct nvkm_subdev *subdev = &gsp->subdev;
> >> +     struct nvfw_gsp_rpc *msg;
> >> +     struct gsp_msgq_recv_args args = { 0 };
> >> +     u32 size;
> >> +
> >> +     /* Peek the header of message */
> >> +     args.time = time;
> >> +     args.repc = sizeof(*msg);
> >> +     args.prepc = &size;
> >> +
> >> +     msg = gsp_msgq_recv(gsp, &args);
> >> +     if (IS_ERR_OR_NULL(msg))
> >> +             return msg;
> >> +
> >> +     if (msg->function != NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD) {
> >> +             nvkm_error(subdev, "Not a continuation of a large RPC\n");
> >> +             r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
> >> +             return ERR_PTR(-EIO);
> >> +     }
> >> +
> >> +     *payload_size = msg->length - sizeof(*msg);
> >> +
> >> +     /* Recv the continuation message */
> >> +     args.time = time;
> >> +     args.repc = msg->length;
> >> +     args.prepc = NULL;
> >> +     args.msg = buf;
> >> +     args.skip_copy_rpc_header = true;
> >> +
> >> +     return gsp_msgq_recv(gsp, &args);
> >>   }
> >>
> >>   static void *
> >> -r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
> >> +r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 msg_repc, u32 total_repc,
> >> +                int time)
> > 
> > Please add a kernel doc comment as well and explain the arguments. All the
> > different sizes quickly become very confusing.
> > 
> > It would also be good to establish a common naming scheme for all the different
> > sizes. Would you mind adding a separate patch that does that?
> > 
> > You can add comment at the beginning of the file explaining all the different
> > sizes and assign them a unique name that we then can use throughout the driver.
> >
> 
> I think maybe we can define the terms of the size after the doc, where 
> just explained the GSP RPC message layout. Should be much eaiser then.

Sure, sounds good.

> 
> > Also, I still find the "repc" thing confusing. If it's just a size why not just
> > call it "size"?
> > 
> >>   {
> >> -     return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
> >> +     struct gsp_msgq_recv_args args = { 0 };
> >> +     struct nvfw_gsp_rpc *msg;
> > 
> > Please try to avoid name collisions, such as naming this `msg`, which has
> > nothing to do with the below `args.msg`.
> > 
> >> +     const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
> >> +     const u32 max_rpc_size = max_msg_size - sizeof(*msg);
> >> +     u32 repc = total_repc;
> >> +     u8 *buf, *next;
> >> +
> >> +     if (WARN_ON(msg_repc > max_msg_size))
> >> +             return NULL;
> >> +
> >> +     buf = kvmalloc(max_t(u32, msg_repc, total_repc + sizeof(*msg)), GFP_KERNEL);
> >> +     if (!buf)
> >> +             return ERR_PTR(-ENOMEM);
> >> +
> >> +     /* Recv the message */
> >> +     args.time = time;
> >> +     args.repc = msg_repc;
> >> +     args.prepc = NULL;
> >> +     args.msg = buf;
> >> +     args.skip_copy_rpc_header = false;
> >> +
> >> +     msg = gsp_msgq_recv(gsp, &args);
> >> +     if (IS_ERR_OR_NULL(msg)) {
> >> +             kfree(buf);
> >> +             return msg;
> >> +     }
> >> +
> >> +     if (total_repc <= max_rpc_size)
> >> +             return buf;
> >> +
> >> +     /* Gather the message from the following continuation messages. */
> >> +     next = buf;
> >> +
> >> +     next += msg_repc;
> >> +     repc -= msg_repc - sizeof(*msg);
> >> +
> >> +     while (repc) {
> >> +             struct nvfw_gsp_rpc *cont_msg;
> >> +             u32 size;
> >> +
> >> +             cont_msg = r535_gsp_msgq_recv_continuation(gsp, &size, next,
> >> +                                                   time);
> >> +             if (IS_ERR_OR_NULL(cont_msg)) {
> >> +                     kfree(buf);
> >> +                     return cont_msg;
> >> +             }
> >> +             repc -= size;
> >> +             next += size;
> >> +     }
> >> +
> >> +     /* Patch the message length. The caller sees a consolidated message */
> >> +     msg->length = total_repc + sizeof(*msg);
> >> +     return buf;
> >>   }
> >>
> >>   static int
> >> @@ -234,54 +370,33 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
> >>        return cmd->data;
> >>   }
> >>
> >> -struct nvfw_gsp_rpc {
> >> -     u32 header_version;
> >> -     u32 signature;
> >> -     u32 length;
> >> -     u32 function;
> >> -     u32 rpc_result;
> >> -     u32 rpc_result_private;
> >> -     u32 sequence;
> >> -     union {
> >> -             u32 spare;
> >> -             u32 cpuRmGfid;
> >> -     };
> >> -     u8  data[];
> >> -};
> >> -
> >>   static void
> >>   r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
> >>   {
> >>        kvfree(msg);
> >>   }
> >>
> >> -static void
> >> -r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
> >> -{
> >> -     if (gsp->subdev.debug >= lvl) {
> >> -             nvkm_printk__(&gsp->subdev, lvl, info,
> >> -                           "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
> >> -                           msg->function, msg->length, msg->length - sizeof(*msg),
> >> -                           msg->rpc_result, msg->rpc_result_private);
> >> -             print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
> >> -                            msg->data, msg->length - sizeof(*msg), true);
> >> -     }
> >> -}
> >> -
> >>   static struct nvfw_gsp_rpc *
> >>   r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
> >>   {
> >>        struct nvkm_subdev *subdev = &gsp->subdev;
> >> +     struct gsp_msgq_recv_args args = { 0 };
> >>        struct nvfw_gsp_rpc *msg;
> >>        int time = 4000000, i;
> >>        u32 size;
> >>
> >>   retry:
> >> -     msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
> >> +     /* Peek the header of message */
> >> +     args.time = time;
> >> +     args.repc = sizeof(*msg);
> >> +     args.prepc = &size;
> >> +
> >> +     msg = gsp_msgq_recv(gsp, &args);
> >>        if (IS_ERR_OR_NULL(msg))
> >>                return msg;
> >>
> >> -     msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
> >> +     /* Recv the message */
> >> +     msg = r535_gsp_msgq_recv(gsp, msg->length, repc, time);
> >>        if (IS_ERR_OR_NULL(msg))
> >>                return msg;
> >>
> >> @@ -734,6 +849,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> >>        mutex_lock(&gsp->cmdq.mutex);
> >>        if (rpc_size > max_rpc_size) {
> >>                const u32 fn = rpc->function;
> >> +             u32 remain_rpc_size = rpc_size;
> >>
> >>                /* Adjust length, and send initial RPC. */
> >>                rpc->length = sizeof(*rpc) + max_rpc_size;
> >> @@ -744,11 +860,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> >>                        goto done;
> >>
> >>                argv += max_rpc_size;
> >> -             rpc_size -= max_rpc_size;
> >> +             remain_rpc_size -= max_rpc_size;
> >>
> >>                /* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
> >> -             while (rpc_size) {
> >> -                     u32 size = min(rpc_size, max_rpc_size);
> >> +             while (remain_rpc_size) {
> >> +                     u32 size = min(remain_rpc_size, max_rpc_size);
> >>                        void *next;
> >>
> >>                        next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
> >> @@ -764,19 +880,20 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> >>                                goto done;
> >>
> >>                        argv += size;
> >> -                     rpc_size -= size;
> >> +                     remain_rpc_size -= size;
> >>                }
> >>
> >>                /* Wait for reply. */
> >> -             if (wait) {
> >> -                     rpc = r535_gsp_msg_recv(gsp, fn, repc);
> >> -                     if (!IS_ERR_OR_NULL(rpc))
> >> +             rpc = r535_gsp_msg_recv(gsp, fn, rpc_size);
> >> +             if (!IS_ERR_OR_NULL(rpc)) {
> >> +                     if (wait)
> >>                                repv = rpc->data;
> >> -                     else
> >> -                             repv = rpc;
> >> -             } else {
> >> -                     repv = NULL;
> >> -             }
> >> +                     else {
> >> +                             nvkm_gsp_rpc_done(gsp, rpc);
> >> +                             repv = NULL;
> >> +                     }
> >> +             } else
> >> +                     repv = wait ? rpc : NULL;
> >>        } else {
> >>                repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
> >>        }
> >> --
> >> 2.34.1
> >>
> 
