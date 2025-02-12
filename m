Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C13A3272F
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 14:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F53810E190;
	Wed, 12 Feb 2025 13:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SP3orfs2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5C410E190;
 Wed, 12 Feb 2025 13:33:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 998B45C5D14;
 Wed, 12 Feb 2025 13:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE441C4CEE2;
 Wed, 12 Feb 2025 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739367199;
 bh=hJ7AesODMzSU0XdwSXIGMwMSpuSoZWAS95HYwQglNNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SP3orfs2S5tGDW7xLwaen7rcRB/+RdsywJDCdC/NF/CBNurbVIr0de5E4a4Nlh+v1
 XWyDPEDLeNU7mY1fOkIC8jcjiO0F1l27Dz32pH2A1PYEnmdiadXbpCEIB1bJ/+Ut2s
 OB/31+irEauoqjSRpacRz5XpFoUthpC6nW2Z/eZR9Yng4EmMN9BFRoI6UlYLsZ2iS+
 t3X6wzuHyHzNRqSRwB8Vv8UygtHsFNAerUlQW5pL6ExFAJ/z2Akcgkvpg52+jDOmoF
 8C0uyy2LWaReK0Qmf/nUZmehB1bLtxVXqKXHGo0pdjzTgYa7VbKaxa2tcAzWdYb3RL
 3ceHFfDq4301A==
Date: Wed, 12 Feb 2025 14:33:14 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Message-ID: <Z6yjGoOPkZdjXRrY@pollux>
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-4-zhiw@nvidia.com>
 <D7Q9SQ3YZD6V.1QXQ18Y0EVOML@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7Q9SQ3YZD6V.1QXQ18Y0EVOML@nvidia.com>
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

On Wed, Feb 12, 2025 at 03:57:38PM +0900, Alexandre Courbot wrote:
> On Sat Feb 8, 2025 at 2:58 AM JST, Zhi Wang wrote:
> > There can be multiple cases of handling the GSP RPC messages, which
> > are the reply of GSP RPC commands according to the requirement of the
> > callers and the nature of the GSP RPC commands.
> >
> > Some GSP RPC command needs a new reply policy: "caller don't care about
> > the message content but want to make sure a reply is received". To
> > support this case, a new reply policy is introduced.
> >
> > Introduce new reply policy NVKM_GSP_RPC_REPLY_POLL, which waits for the
> > returned GSP message but discards it for the caller.
> >
> > No functional change is intended.
> >
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 1 +
> >  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > index c467e44cab47..bc16510261b8 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > @@ -33,6 +33,7 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 rep
> >  
> >  enum {
> >  	NVKM_GSP_RPC_REPLY_RECV = 1,
> > +	NVKM_GSP_RPC_REPLY_POLL,
> >  };
> >  
> >  struct nvkm_gsp {
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > index bc8eb9a3cb28..af2836cca38f 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > @@ -601,6 +601,9 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, int reply,
> >  		else
> >  			repv = msg;
> >  		break;
> > +	case NVKM_GSP_RPC_REPLY_POLL:
> > +		repv = r535_gsp_msg_recv(gsp, fn, 0);
> > +		break;
> >  	default:
> >  		repv = ERR_PTR(-EINVAL);
> >  		break;
> 
> I suspect patch 4 can be merged into this one, so we introduce the user
> at the same time as the functionality.

I agree, please merge this one with patch 4 and add the corresponding 'Fixes'
tag.
