Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98D14D6D7
	for <lists+nouveau@lfdr.de>; Thu, 30 Jan 2020 07:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE76E558;
	Thu, 30 Jan 2020 06:54:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5276E558
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2020 06:54:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A62CB206F0;
 Thu, 30 Jan 2020 06:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580367293;
 bh=LOqUso584/AMDozGRafxzcD0fj6VetI0LQQnKF40cSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p9CCHcEx4l+qR/SK0UrwG6EWtsr5gVrfACYJMysd+xBFjKFLMC4z9Mm4NiO/nn8ZB
 cd9cYCj1Ytv2UrH+AeExdTBBUgWIIMTCq10cSaS1H7XK1t/5O93knLA54SdWx1ZdzW
 Gyi28RC6DZNCqTmhb/dq3ITjkG5ihT/7K6oxcFz8=
Date: Thu, 30 Jan 2020 07:54:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Message-ID: <20200130065450.GA629439@kroah.com>
References: <8a82672e-1a8d-b08e-b387-11ffecd5ba07@qubes-os.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a82672e-1a8d-b08e-b387-11ffecd5ba07@qubes-os.org>
Subject: Re: [Nouveau] nv50_disp_chan_mthd: ensure mthd is not NULL
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 05:22:13PM +0100, Fr=E9d=E9ric Pierret wrote:
> Dear Ben Skeggs,
> =

> Please find attached a patch solving a blocking issue I encountered:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206299
> =

> Basically, running at least a RTX2080TI on Xen makes a bad mmio error
> which causes having 'mthd' pointer to be NULL in 'channv50.c'. From the
> code, it's assumed to be not NULL by accessing directly 'mthd->data[0]'
> which is the reason of the kernel panic. I simply check if the pointer
> is not NULL before continuing.
> =

> Best regards,
> =

> Fr=E9d=E9ric Pierret
> =


> From: =3D?UTF-8?q?Fr=3DC3=3DA9d=3DC3=3DA9ric=3D20Pierret=3D20=3D28fepitre=
=3D29?=3D
>  <frederic.pierret@qubes-os.org>
> Date: Sun, 26 Jan 2020 23:24:33 +0100
> Subject: [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
> =

> Pointer to structure array is assumed not NULL by default. It has
> the consequence to raise a kernel panic when it's not the case.
> =

> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D206299
> Signed-off-by: Fr=E9d=E9ric Pierret (fepitre) <frederic.pierret@qubes-os.=
org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> index bcf32d92ee5a..50e3539f33d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> @@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int de=
bug)
>  =

>  	if (debug > subdev->debug)
>  		return;
> +	if (!mthd)
> +		return;
>  =

>  	for (i =3D 0; (list =3D mthd->data[i].mthd) !=3D NULL; i++) {
>  		u32 base =3D chan->head * mthd->addr;
> -- =

> 2.21.0
> =





<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
