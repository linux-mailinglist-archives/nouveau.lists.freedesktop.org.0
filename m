Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A6CBEA30
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:28:21 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E49410E5F0;
	Mon, 15 Dec 2025 15:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alyssa.is header.i=@alyssa.is header.b="aY6xktXF";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="FIysPx8J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EDE144551E;
	Mon, 15 Dec 2025 15:20:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765812055;
 b=g4myEfR9S3yITp5QKCgszCD48LW7V174Ztnb7EubE4vAlZpQy4cdAfhOJgQyKHyzuk+65
 Bq9pxDqPgitAK0Qa6QCgJkt0fwMBvgtIRNB06cllXdVNvPAt/Gw3wfCf1x7jMIStDwUP52e
 xOcKW8IJd3RojrFmsswn/FKpfrvlGnMV/oi2t4Lxoj9Nk+NJngn6URNHTlPx73Hhqs+hLKQ
 fjfFndCpPqi1ammFC0cwgbMLS/PYvAPKK6lQkChHEHoaEczIYLYa/IPhIQcUQizivcy9h3/
 +vrbCR8EjQnu2isuuPss9yzpJAEJpUTXlgUN3Inr7/LSSzm4p7dqffFnuRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765812055; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1Phmm/5vZYYPW8bDSlyTMfT6TjIj47RIYXoblz6jhQk=;
 b=bT+Hf8gAivaLGZOgPx6kuy1tVesqNJOURUvR43yceDu/kb85YE7R1WI6qHOUsPGlfG3Vn
 TDaqDsAwZrrl2WMj1Rx7XW48Yr0F2kkSolwocgp9gU3IQNfNvJOjNlIyWbao4XA4no9s/vr
 BEUjL07SXQhvdyTHFYOssEOe6lx2g3U6sOVEi44RO2A+rvC2vKZ6XJ5LAToL620U0KWwipS
 RfnSrpAUZVkTBaMPZ77VCH4irFY0gycbN6VNXdXojDorTG5PxTP95af+3xjbrQYbrMNc7ah
 FxSWqTbpcGg6wdyGtwqqEqt3eAfnTNwBRGBU4y6Ry84a5rBlGwkbaZEIECzw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=alyssa.is;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=alyssa.is;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 18F7445514
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 14:58:45 +0000 (UTC)
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 15:06:08 UTC
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 616D510E4F8;
	Mon, 15 Dec 2025 15:06:08 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5DF2A7A0170;
	Mon, 15 Dec 2025 10:00:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 15 Dec 2025 10:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765810801; x=1765897201; bh=1Phmm/5vZY
	YPW8bDSlyTMfT6TjIj47RIYXoblz6jhQk=; b=aY6xktXFhNyDSgy8j5Yacay8rJ
	yM/gNZQe5C5z5E3Fqf9PVA0+EA7QG4gFf+4gfYfR5BWRlMSRhZbbZ3KHfYgeojGU
	Ei54ZZtsNGFnE8VamoJkylE1oUS07rEBfJkN2SGRMZxEFeTN3YPGpeWiC/GiP/QY
	uw+9YRMNbhx3ezdvj66xep1+3RQ+rLJiOYI2eTgxJVnpj2/AkjftN6Td1IPSl4Q6
	BkfyXBNRWfvVRr4fiA1mqpd8aImdyWH89ADHyO2vA8GYLUKbWEmgTC/outcE7sDB
	VDmAr8d31gnu+KrWjOF+jq+bB5l7kjzHSs2kU+bQBnNgdVHCYUgb0UE487Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765810801; x=1765897201; bh=1Phmm/5vZYYPW8bDSlyTMfT6TjIj47RIYXo
	blz6jhQk=; b=FIysPx8JmGdwuHD2PhaCmk5Ou9HOf2nisEwjIgTn+lRYdz6bN7m
	KzjB0Shr6EhEmVLJAL0qHswainsG938XvNrJzJlhGl+NT6UWe6xSs+Oup+WD6Rwn
	MlHlAE3bkZG3WIxC6pQbwDku6HdWMLImq5n4GOIDwfry5G4DqTPoQT3F32oBNoEX
	OSVVa5BsXfDnel0M5Ct2zBD66uAmUEzcd1H1kNKHTVJ2M+YVHPrgvu/2mmfxwZF7
	Kh/3JuyBCdu6vc7eSutA3v7svCSyHrkYZucc3ZwMdhxvenDfiBOXy5/wSDcP8chx
	vrnCfgKvXLtPdZrxM9xNdRgju2Q2F4h0FHA==
X-ME-Sender: <xms:cCJAafbzOwJSmWWOrKlZmcGtNCvo60oDqy0tXIbvD5AweoXy9L07KA>
    <xme:cCJAafLs8Ez_jZ_UJth-lo1FDKYopbidXLvk7w4W6zwVMAr4UQS41ggpNAfJ8fyvQ
    c6ViYUj0tjgjYrwlaB_C-NqecMzq4x6rReoa5xyvmfP2xaIa8vl>
X-ME-Received: 
 <xmr:cCJAaa1-U7ApbaocfsaQF24sgIAFwPk71Mc1ZsyhKS6CMb7Th2KV_x2d5wqVYEfC>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefjeduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeetlhihshhsrgcu
    tfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpedugfeiue
    fhheefffehudejffejkeejvdehhfettdegffeggfdthfeuheetueevudenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhspdhnsggprhgtphhtthhopeeftddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrd
    horhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihht
    rgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhkrghllhifvg
    hithdusehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:cCJAadjzdipBnelqIWMcfi7o7qNCmbZu6EXg5-TFuwjedr4Sq69OiQ>
    <xmx:cCJAaZwlrOkjVCQODfAhojW2YuCKwL97b7burAoUC6g_hlowHnEibA>
    <xmx:cCJAaSGb-XJARpcLZOVPRLwqqqcmTXShPPb7O5G9SxeSltsQpvKibw>
    <xmx:cCJAaaRt59fcrOcc0kjBerSfnJDzvV7U4uetT901LSbYxCpIrQQf5w>
    <xmx:cSJAaZdZPt5PWbPehk7srgOqxORrWjgouhKLICboq3Rh3VrGbUnMx1om>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Dec 2025 09:59:59 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
	id DE2E26D9BBB2; Mon, 15 Dec 2025 15:59:48 +0100 (CET)
Date: Mon, 15 Dec 2025 15:59:48 +0100
From: Alyssa Ross <hi@alyssa.is>
To: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
Message-ID: <c3e35e5hgnx6vozhoyefhvaznr64wm5qlrqwyzuhwn3v7cnuos@ueh6wqayvirf>
References: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
 <20251106-b4-select-rust-fw-v3-2-771172257755@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rbwj3d62asxihgzx"
Content-Disposition: inline
In-Reply-To: <20251106-b4-select-rust-fw-v3-2-771172257755@nvidia.com>
X-MailFrom: hi@alyssa.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: N7OP5WIUS4ACPSA4CB57ODA4YCZ3PZT5
X-Message-ID-Hash: N7OP5WIUS4ACPSA4CB57ODA4YCZ3PZT5
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:20:52 +0000
CC: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N7OP5WIUS4ACPSA4CB57ODA4YCZ3PZT5/>
Archived-At: 
 <https://lore.freedesktop.org/c3e35e5hgnx6vozhoyefhvaznr64wm5qlrqwyzuhwn3v7cnuos@ueh6wqayvirf/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--rbwj3d62asxihgzx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
MIME-Version: 1.0

On Thu, Nov 06, 2025 at 11:40:55AM +0900, Alexandre Courbot wrote:
> RUST_FW_LOADER_ABSTRACTIONS was depended on by NOVA_CORE, but NOVA_CORE
> is selected by DRM_NOVA. This creates a situation where, if DRM_NOVA is
> selected, NOVA_CORE gets enabled but not RUST_FW_LOADER_ABSTRACTIONS,
> which results in a build error.
>
> Since the firmware loader is an implementation detail of the driver, it
> should be enabled along with it, so change the "depends on" to a
> "select".
>
> Fixes: 54e6baf123fd ("gpu: nova-core: add initial driver stub")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

I just encountered this testing 6.19-rc1, and was pleased to discover
this patch had already been submitted.

Tested-by: Alyssa Ross <hi@alyssa.is>

And it probably also makes sense to add this now that the kernel test
robot has also found it:

Closes: https://lore.kernel.org/oe-kbuild-all/202512061721.rxKGnt5q-lkp@intel.com/

(I suppose it doesn't make sense to add the Reported-by suggested there
since your patch predates that report.)

I see that the first patch from this series has already been picked up
by Greg, but this and patch 3 are still waiting.  Is that correct?

>  drivers/gpu/nova-core/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> index 20d3e6d0d796..527920f9c4d3 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -3,7 +3,7 @@ config NOVA_CORE
>  	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
> -	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	select RUST_FW_LOADER_ABSTRACTIONS
>  	select AUXILIARY_BUS
>  	default n
>  	help
>
> --
> 2.51.2
>

--rbwj3d62asxihgzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCaUAiYwAKCRBbRZGEIw/w
osIcAP9fvByVdz44dZc5ybBMSW5gZSx7h6ZkUGgNq6HIshurJAD/cVjmaI97Xoh9
tcNHiZ9bbAXKGCnzlJLuN8Vld9VuXwA=
=UYKh
-----END PGP SIGNATURE-----

--rbwj3d62asxihgzx--
