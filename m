Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56929468D1
	for <lists+nouveau@lfdr.de>; Sat,  3 Aug 2024 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BC210E011;
	Sat,  3 Aug 2024 09:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="egGLH6jH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A4910E011
 for <nouveau@lists.freedesktop.org>; Sat,  3 Aug 2024 09:27:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8DCE3CE01CE;
 Sat,  3 Aug 2024 09:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12AFC116B1;
 Sat,  3 Aug 2024 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722677246;
 bh=gWMn+T990ottfJcYM6XKX87NdnQTMTsRfn21wYALm+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egGLH6jHRVBPCwkeRLX0OB0d4bnPcoL12sPz6lu/kUrpj1iTbQM5oN0JpWRHjaKu/
 UpUFZfw1U/XhC4InJ3vNJaw2A49NfD3mVpXv+rcVZeT26d89TlzW37moxrE5oyU91D
 C8ATydzxZiF2HRb9vzrNG78ev/eARkGHRKS3r7b4x5QQ/SFHV3Vs+8rRdQtERIndHx
 x7Atr4SDUnLAwoxFBRnvVAEOnmIbJ5LOidOmAnO+8gqUk2rQfbnc1x2PF4kQXJ85LB
 BHf5pE5fBlQ5MDEKtMqVKKl+P2E1ES5RLpqhTeWR9IBwFB+E6YGc3kWzSNwhgfXZyk
 rH+8yFH7gPoFA==
Date: Sat, 3 Aug 2024 11:27:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 2/2] [v7] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <Zq33-u8iGUWtGr9v@pollux>
References: <20240802190517.2548654-1-ttabi@nvidia.com>
 <20240802190517.2548654-2-ttabi@nvidia.com>
 <Zq1zDcN2JYTro7VW@cassiopeiae>
 <d7a748a9c32c2dcb5bbc8d86a62d987d3b6ef7c4.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7a748a9c32c2dcb5bbc8d86a62d987d3b6ef7c4.camel@nvidia.com>
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

On Sat, Aug 03, 2024 at 03:23:48AM +0000, Timur Tabi wrote:
> On Sat, 2024-08-03 at 02:00 +0200, Danilo Krummrich wrote:
> > > +       /* Each GPU has a subdir based on its device name, so find it */
> > > +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> > 
> > In drm-misc-next dev_get_drvdata() returns a struct nouveau_drm.
> > Interestingly,
> > things do not blow up however.
> > 
> > Instead, I noticed that your debugfs entries are created in the debugfs
> > root,
> > instead of "dri/<PCI_ID>/".
> 
> Woah.
> 
> > I think we shouldn't try to use the DRI debugfs directory anyway to avoid
> > DRM
> > layer dependencies in nvkm. Let's create our own nouveau one, like you did
> > in
> > earlier versions of this patch.
> 
> So what path should I use?

I think we should just create "nouveau/<PCI_ID>/" instead and not mess with the
DRI stuff at all.

> 
> So what it's supposed to do is create a sort of "shadow" dri/<PCI_ID>/ path
> that overlays the existing one.  So when the module deletes the original
> dri/<PCI_ID>/, the one I create replaces it automatically.  I think it's a
> neat feature.  The path to the debugfs entries stays the same whether or not
> they're migrated.  
> 
> > Please also make sure to test your patches on a recent drm-misc-next branch.
> 
> Will do.
