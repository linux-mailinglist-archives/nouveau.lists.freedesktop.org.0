Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14FADCC6F
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 15:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31010E676;
	Tue, 17 Jun 2025 13:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HbXtzZWz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D9210E676
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 13:05:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2ED1E629F9;
 Tue, 17 Jun 2025 13:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E912C4CEE3;
 Tue, 17 Jun 2025 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750165509;
 bh=z9tdSEAIFxej5/oWiSDe8keUDTaAtx0GsbZFpAEI4fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HbXtzZWzdTPwOfpopfp50VjiIqkQh1rNRrSaOSkJx14ApD6yEFcHiTtKenqcHdlVA
 JixgdNe/qgwEaWlvpghyE4gVeNDGdjJy2AbYfKyjVtnnyis1CiRmQ5yffn89bxW+V/
 +b9T0znq0BNNYBr2vZs4zXjjNKD5ul6+R9LQKAraNdIftyU5S0wu+v+QhXiOYq7osX
 X8f8TNSF4XLSJ+mFDeNC0kcjVuX/F9eZ9Yl+boRGsZOmMRsUxsuJSIrw+wB/nyynqc
 T1ozoFl0gWpAe/hcebVfNrlkfCK6C9ylHvAjVEA42S9pnr9NQZCSsniWnRgkBVx8Vr
 CJpamy0dRD2Dw==
Date: Tue, 17 Jun 2025 15:05:06 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
Message-ID: <aFFoAnIO4bjupYT2@pollux>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
 <f09b10e30f38cc094c4070e318d41262c0118f31.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f09b10e30f38cc094c4070e318d41262c0118f31.camel@redhat.com>
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

On Tue, Jun 17, 2025 at 01:29:20PM +0200, Philipp Stanner wrote:
> On Tue, 2025-06-17 at 14:00 +1000, Ben Skeggs wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > index baf42339f93e..b098a7555fde 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> 
> This seems to be based on a code move that is not yet in mainline.

It is, it did land with v6.16-rc1.

> Therefore, backporting the bugfix to stable seems difficult. Since that
> code move is already in drm-misc-next, it would seem that it can only
> be solved with two distinct patches for stable and for -next.

drm-misc-fixes is the relevant target branch and given the above, it contains
the code move as well.

However, you're right that this fix won't apply to anything before v6.16-rc1.
Given that, it makes sense to leave a note below the '---' line that this fix
won't apply before v6.16-rc1 and that a backported patch will be sent to stable
once this one hit Linus' tree.

> But this needs to be judged by a maintainer.
> 
> > @@ -719,7 +719,6 @@ r535_gsp_acpi_caps(acpi_handle handle,
> > CAPS_METHOD_DATA *caps)
> >  	union acpi_object argv4 = {
> >  		.buffer.type    = ACPI_TYPE_BUFFER,
> >  		.buffer.length  = 4,
> > -		.buffer.pointer = kmalloc(argv4.buffer.length,
> > GFP_KERNEL),
> >  	}, *obj;
> >  
> >  	caps->status = 0xffff;
> > @@ -727,17 +726,22 @@ r535_gsp_acpi_caps(acpi_handle handle,
> > CAPS_METHOD_DATA *caps)
> >  	if (!acpi_check_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV,
> > BIT_ULL(0x1a)))
> >  		return;
> >  
> > +	argv4.buffer.pointer = kmalloc(argv4.buffer.length,
> > GFP_KERNEL);
> > +	if (!argv4.buffer.pointer)
> > +		return;
> > +
> 
> This could be done immediately after the creation of argv4. That way
> it's more difficult to have the leak again if something is inserted
> later on.

I think the idea was to avoid a potential unwind path after acpi_check_dsm().

> >  	obj = acpi_evaluate_dsm(handle, &NVOP_DSM_GUID,
> > NVOP_DSM_REV, 0x1a, &argv4);
> >  	if (!obj)
> > -		return;
> > +		goto done;
> >  
> >  	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
> >  	    WARN_ON(obj->buffer.length != 4))
> > -		return;
> > +		goto done;
> >  
> >  	caps->status = 0;
> >  	caps->optimusCaps = *(u32 *)obj->buffer.pointer;
> >  
> > +done:
> >  	ACPI_FREE(obj);
> >  
> >  	kfree(argv4.buffer.pointer);
> > @@ -754,24 +758,28 @@ r535_gsp_acpi_jt(acpi_handle handle,
> > JT_METHOD_DATA *jt)
> >  	union acpi_object argv4 = {
> >  		.buffer.type    = ACPI_TYPE_BUFFER,
> >  		.buffer.length  = sizeof(caps),
> > -		.buffer.pointer = kmalloc(argv4.buffer.length,
> > GFP_KERNEL),
> >  	}, *obj;
> >  
> >  	jt->status = 0xffff;
> >  
> > +	argv4.buffer.pointer = kmalloc(argv4.buffer.length,
> > GFP_KERNEL);
> > +	if (!argv4.buffer.pointer)
> > +		return;
> > +
> >  	obj = acpi_evaluate_dsm(handle, &JT_DSM_GUID, JT_DSM_REV,
> > 0x1, &argv4);
> >  	if (!obj)
> > -		return;
> > +		goto done;
> >  
> >  	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
> >  	    WARN_ON(obj->buffer.length != 4))
> > -		return;
> > +		goto done;
> >  
> >  	jt->status = 0;
> >  	jt->jtCaps = *(u32 *)obj->buffer.pointer;
> >  	jt->jtRevId = (jt->jtCaps & 0xfff00000) >> 20;
> >  	jt->bSBIOSCaps = 0;
> >  
> > +done:
> 
> 'done' seems like a bad name considering that the operations are
> aborted with a WARN_ON above. Better 'abort' or sth like that.

I think some neutral name is fine, since we also enter this code path when
everything went well, maybe 'out_free' or just 'free'?

> P.
> 
> >  	ACPI_FREE(obj);
> >  
> >  	kfree(argv4.buffer.pointer);
> 
