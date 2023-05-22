Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2877373BA
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5A910E332;
	Tue, 20 Jun 2023 18:20:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 643 seconds by postgrey-1.36 at gabe;
 Mon, 22 May 2023 08:03:28 UTC
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCAB10E269
 for <nouveau@lists.freedesktop.org>; Mon, 22 May 2023 08:03:28 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 1897E13C2DA;
 Mon, 22 May 2023 09:55:21 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684742122; bh=+ecvThwVNIF+3jNDHwnBtc4nIfmBUPqhUAXqbUCfwlk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=w6Ocr72GrnkWKmosOG9bJ8iIBfigFQC9bv9xRTioGZ2CSHlV1/RuH3eE+gUvmnvfs
 nupeVvjngA4t2geGD3q69X34CzBWx4qAmKkpMuMnSFHVYByJ5zbwogqgIPUcoeZdqa
 RqNtDRI+JKpfH9XtQLhgST01DHruuB5GwQejM4Ac7KHF3ZawwFK/uucm8u7sEHcsSb
 n5PuaYK1sl0TjJmngp2og1zrSsW9f7hvCWGHGBD5YJUn25qj/Sh4f0J4vGA0wTbHg3
 1jgpWjjEIZaxcs9YzhpV6ZMzjLM+wn23DgInohFErWKjQU2sYMZYfNvHQ7zx6gSJuh
 Mz/r0JnFTJi2w==
Date: Mon, 22 May 2023 09:54:08 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20230522095408.02874498@meshulam.tesarici.cz>
In-Reply-To: <ZGdLErBzi9MANL3i@mail-itl>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4FW=_VIffR_gzuETX7eJ3Lw";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:12 +0000
Subject: Re: [Nouveau] [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--Sig_/4FW=_VIffR_gzuETX7eJ3Lw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 19 May 2023 12:10:26 +0200
Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> wrote:

> On Fri, May 19, 2023 at 06:04:05AM +0200, Christoph Hellwig wrote:
> > On Thu, May 18, 2023 at 08:18:39PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote: =20
> > > On Thu, May 18, 2023 at 03:42:51PM +0200, Christoph Hellwig wrote: =20
> > > > Remove the dangerous late initialization of xen-swiotlb in
> > > > pci_xen_swiotlb_init_late and instead just always initialize
> > > > xen-swiotlb in the boot code if CONFIG_XEN_PCIDEV_FRONTEND is enabl=
ed.
> > > >=20
> > > > Signed-off-by: Christoph Hellwig <hch@lst.de> =20
> > >=20
> > > Doesn't it mean all the PV guests will basically waste 64MB of RAM
> > > by default each if they don't really have PCI devices? =20
> >=20
> > If CONFIG_XEN_PCIDEV_FRONTEND is enabled, and the kernel's isn't booted
> > with swiotlb=3Dnoforce, yes. =20
>=20
> That's "a bit" unfortunate, since that might be significant part of the
> VM memory, or if you have a lot of VMs, a significant part of the host
> memory - it quickly adds up.

I wonder if dynamic swiotlb allocation might also help with this...

Petr T

--Sig_/4FW=_VIffR_gzuETX7eJ3Lw
Content-Type: application/pgp-signature
Content-Description: Digitální podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQR36mnYrQDNXFnn8/Pem5ZkryZSgUCZGsfoQAKCRDPem5ZkryZ
SqVBAP0bQzVwflJ+O+7tLcfRm7IETeA07OEHXqZhmGqGL5eX8QD9HjbTN1pnVQK5
45KGLgOriHcE1PpDjMqZrgg7MRy/3gY=
=o6/4
-----END PGP SIGNATURE-----

--Sig_/4FW=_VIffR_gzuETX7eJ3Lw--
