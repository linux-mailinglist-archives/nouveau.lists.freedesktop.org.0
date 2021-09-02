Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04C3FF527
	for <lists+nouveau@lfdr.de>; Thu,  2 Sep 2021 22:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BD56E083;
	Thu,  2 Sep 2021 20:53:35 +0000 (UTC)
X-Original-To: Nouveau@lists.freedesktop.org
Delivered-To: Nouveau@lists.freedesktop.org
Received: from m-03.smrt1.linuxpl.com (m-03.smrt1.linuxpl.com [178.63.127.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9DF6E083
 for <Nouveau@lists.freedesktop.org>; Thu,  2 Sep 2021 20:53:33 +0000 (UTC)
Received: from [136.243.64.71] (helo=s29.cyber-folks.pl)
 by smrt1.linuxpl.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <przemo@firszt.eu>)
 id 1mLtiF-001N5e-KP; Thu, 02 Sep 2021 22:53:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=firszt.eu; 
 s=x;
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:
 Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j22Pnxcg7ndNKByJ/AIUO798BffEzpY/ZgRe8w5cksA=; b=CDmReM124Ya962HzA6Embku+nq
 fEMNaK0M+KxYc7F0ii4HnGiJb/mWpSo0WP7e/iDYk88qDn3foTF6kiCa/uSqsFegQgCiVuvmPd0Te
 2j9LvdAfrRc57/ijetffG3/rAuOK53BsrUXPlZeKkIWwzr97EDuNPYWzJg/WGJ1i/GRk7Zh3IB+bb
 LfN0AFoCigSbWsdOPh1mstsNF6T3YpDnY/HRKEh4n+T7wDBeSilK91BZoyKKmnPkJ8cqM2TeiATIO
 u+2TgvV3D12OVTs6gsbTAVaMsk82G5pyuZsjDMrRKzbwfqae3epdM5DlfXerpUMrYs62hYP09he+F
 cDAcUy1w==;
Received: from [109.78.28.199] (helo=[192.168.1.156])
 by s29.cyber-folks.pl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <przemo@firszt.eu>)
 id 1mLti9-0007DG-3A; Thu, 02 Sep 2021 22:53:28 +0200
Message-ID: <b077ae0710f10cdd688ccddbca82e9ee734c5a56.camel@firszt.eu>
From: Przemo Firszt <przemo@firszt.eu>
To: Ben Skeggs <skeggsb@gmail.com>, Karol Herbst <kherbst@redhat.com>
Cc: nouveau <Nouveau@lists.freedesktop.org>
Date: Thu, 02 Sep 2021 21:53:30 +0100
In-Reply-To: <CACAvsv6YMuR=z5OHcqNQJSF5Rcjbw4wGEpKR2XwPcjGhLMEmbw@mail.gmail.com>
References: <d9e232668dee230a02206baf2c528c67b9c1ec6d.camel@firszt.eu>
 <CACO55tviKOiQk3DmxNFhMTHVAZC4gT4VUvPqRWLRa8eDb9bGRA@mail.gmail.com>
 <CACAvsv6YMuR=z5OHcqNQJSF5Rcjbw4wGEpKR2XwPcjGhLMEmbw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-dI1KHrC42/gHo6DZD5QE"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Subject: Re: [Nouveau] RTX 3070 / NV174 / GA104 - is there any development
 happening?
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


--=-dI1KHrC42/gHo6DZD5QE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-09-02 at 10:07 +1000, Ben Skeggs wrote:
> On Thu, 2 Sept 2021 at 08:25, Karol Herbst <kherbst@redhat.com>
> wrote:
> > > [
> > ..]
> > Sadly there isn't much you can do right now as the next step is to
> > wait until Nvidia releases and publishes firmware files in order to
> > enable acceleration in Nouveau. Once that happens we will enable
> > OpenGL on those GPUs and then everybody is welcomed to report bugs
> > and
> > so on. But atm it just stalls on the initial enablement of those
> > pieces. The firmware would land in the linux-firmware repository
> > under
> > nvidia/ga104 for your GPU.
> I have had a whole slew of code sitting around locally for quite a
> while now, towards enabling acceleration on these GPUs.=C2=A0 Ampere has
> some significant changes in a few areas.=C2=A0 It hadn't been a huge
> priority to push out due to the lack of available firmware, and I'd
> taken the opportunity to work it in with numerous other improvements
> which will benefit earlier chipsets / work towards enabling Vulkan at
> the same time.
>=20
> However, it turns out Optimus/Prime without copy engine support
> (engine/ce, which depends on engine/host) is probably not possible.
> And, likely unusable even if it were.=C2=A0 So, I'm working furiously to
> get those chunks of it ready ASAP to at least enable those use-cases.
> Hopefully full acceleration will appear not too long afterwards, I'm
> working with NVIDIA on it.
>=20
> >=20
Thank you very much for the info! I'll sit tight and watch the list.
--=20
Kind regards,
Przemo Firszt


--=-dI1KHrC42/gHo6DZD5QE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEES47+VVWiUx0l5J35NDc3r6iXFhsFAmExOcoACgkQNDc3r6iX
Fhs2qAgAqKGtt4w4NRha4cFez6cSrFkj1udzjuCAa2lRU2UvYqn3XOBY/6jV3wdB
o1ANxn+wxnAHHYXNd22BB/krhq7Ei4qQ2FAVpCwi+2gXJnC3qTIEYWlxIEeKvE2p
0yY+FSrmDxR4o9dH84PQ+5VdeyfU3IDtJ20WssTyJBBCJsuUZf+pysSJ2Of5xTbY
ZE1vQRRvFwm2aQRYObGAEZk4Z0hT5RnZOmIRuazvxsXc6RQQoE0gOVeea1KJj4hN
OOVWNPA493aqDiAJb1TV5iYcHM3dEGHhXMZwsPYsM1UcA9CXWAervckXadHFp6lG
vVgkKZ4ITgTuKwb6aekLdE26T0Aq2g==
=l0Z7
-----END PGP SIGNATURE-----

--=-dI1KHrC42/gHo6DZD5QE--

