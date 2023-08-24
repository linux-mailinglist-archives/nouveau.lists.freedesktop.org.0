Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39421786B4E
	for <lists+nouveau@lfdr.de>; Thu, 24 Aug 2023 11:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75A10E117;
	Thu, 24 Aug 2023 09:16:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B999810E117;
 Thu, 24 Aug 2023 09:16:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3552D66689;
 Thu, 24 Aug 2023 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23845C433C8;
 Thu, 24 Aug 2023 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692868613;
 bh=CK8K59YUSjL1xNRSA2L3H9ryMd1YgDDJ0Z4R5P4hlKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rMfiUcU+r8StcsuNXLiXVRVuNozQ3m7/INGX5Bn3oWmlVIAOoCZ29NDSJyvrv5J4C
 3FhBhrWdEKlMFE2/ltWxQSb6iMzVFdLM+MIcxCT9/FSRXQEDunYAPgiA0oWOUVDh+1
 udCbunZY04xzrkYZk7hh4l2S9NMaghj3pHreMCWS/m0/lU9GWyWwrVZ1jY62VTWrIK
 h3e0/azQPDZBVAAnxcziTw9uFys3FVh7F2oQ4SrJ909pnXS7OWtR0LACIgLHU7kIZr
 JlxetDuvbPnvY0gtpZJl0Av0mvAuct8w3WCgOqoDgcBdRvIUkVY8I8cleiwCOJSJuo
 NSx4tFkmi+qpA==
Date: Thu, 24 Aug 2023 11:16:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <vkoj32cjbaozwcgfrp2mowkm6koqtl6espou6vms2pvfhxr5z7@ofabj6kd2j4r>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="utl4vsmjm3ff53l2"
Content-Disposition: inline
In-Reply-To: <87wmxk4xt3.fsf@intel.com>
Subject: Re: [Nouveau] [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Shashank Sharma <shashank.sharma@amd.com>, Lee Jones <lee@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyun.kwon@xilinx.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Jerome Glisse <glisse@freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--utl4vsmjm3ff53l2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 12:03:20PM +0300, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
>=20
> The next question is, how do we keep it W=3D1 clean going forward?
>=20
> Most people don't use W=3D1 because it's too noisy, so it's a bit of a
> catch-22.
>=20
> In i915, we enable a lot of W=3D1 warnings using subdir-ccflags-y in our
> Makefile. For CI/developer use we also enable kernel-doc warnings by
> default.
>=20
> Should we start enabling some of those warning flags in drm/Makefile to
> to keep the entire subsystem warning free?

I think that's a good idea. At least the documentation fixes I just
merged could have been easily caught before submission.

Maxime

--utl4vsmjm3ff53l2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOcgAgAKCRDj7w1vZxhR
xRGuAQDGwZPeKdcZoqTDIIBQZmkNfIvC9zdZcx372SnD7nYQuAEA+1cA8HP2QUBw
CvoouWKq/gGveaBLwNG3zjffzRx2agE=
=eJTh
-----END PGP SIGNATURE-----

--utl4vsmjm3ff53l2--
