Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2A5CBAE64
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B5510EC16;
	Sat, 13 Dec 2025 12:42:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 2423910E0F2
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jul 2025 00:16:05 +0000 (UTC)
Received: (qmail 4019 invoked by uid 1000); 9 Jul 2025 12:04:22 -0000
Date: Wed, 9 Jul 2025 12:04:22 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Rui Salvaterra <rsalvaterra@gmail.com>, airlied@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] NVIDIA ION graphics broken with Linux 6.16-rc*
Message-ID: <aG5axlstlhnUYks2@audible.transient.net>
Mail-Followup-To: Ben Skeggs <bskeggs@nvidia.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>, airlied@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
 <aG2mzB58k3tkxvK-@audible.transient.net>
 <25642e5b-25ee-49b2-b08d-4c64fa2e505a@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25642e5b-25ee-49b2-b08d-4c64fa2e505a@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Ben Skeggs wrote:
> On 7/9/25 09:16, Jamie Heilman wrote:
> > Rui Salvaterra wrote:
> > > Unfortunately, bisecting is not feasible for me.
> > That looks pretty similar to the problem I posted
> > (https://lore.kernel.org/lkml/aElJIo9_Se6tAR1a@audible.transient.net/)
> > that I bisected to 862450a85b85 ("drm/nouveau/gf100-: track chan
> > progress with non-WFI semaphore release").  It still reverts cleanly
> > as of v6.16-rc5 so you might want to give that a shot.
> 
> Hi,
> 
> Thank you for bisecting!  Are you able to try the attached patch?

Yeah that got graphics visible again for me, though there's something
else horrible going on now (still? I'm not sure if its new behavior or
not) and it blows out my dmesg ringbuffer with errors or warnings of
some kind, that I was just about to start trying to debug that when
some power event seems to have fried my PSU.  Combined with a bunch of
filesystem corruption, its going to be a while a before I can get that
system back up to that spot where I can troubleshoot it again, the
root volume is fried and I'm going to have rebuild.  Anyway, I think
whatever it is was probably an entirely separate issue.

> From 6987c1c254285305fdc20270e21709a313632e0d Mon Sep 17 00:00:00 2001
> From: Ben Skeggs <bskeggs@nvidia.com>
> Date: Wed, 9 Jul 2025 10:54:15 +1000
> Subject: [PATCH] drm/nouveau/nvif: fix null ptr deref on pre-fermi boards
> 
> Check that gpfifo.post() exists before trying to call it.
> 
> Fixes: 862450a85b85 ("drm/nouveau/gf100-: track chan progress with non-WFI semaphore release")
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/chan.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
> index baa10227d51a..80c01017d642 100644
> --- a/drivers/gpu/drm/nouveau/nvif/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvif/chan.c
> @@ -39,6 +39,9 @@ nvif_chan_gpfifo_post(struct nvif_chan *chan)
>  	const u32 pbptr = (chan->push.cur - map) + chan->func->gpfifo.post_size;
>  	const u32 gpptr = (chan->gpfifo.cur + 1) & chan->gpfifo.max;
>  
> +	if (!chan->func->gpfifo.post)
> +		return 0;
> +
>  	return chan->func->gpfifo.post(chan, gpptr, pbptr);
>  }
>  
> -- 
> 2.49.0
> 


-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
