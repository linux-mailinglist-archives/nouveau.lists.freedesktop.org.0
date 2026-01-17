Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DDD38E06
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 12:09:49 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6531A10E0C1;
	Sat, 17 Jan 2026 11:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fem9nmkE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D353E44CB2;
	Sat, 17 Jan 2026 11:01:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768647669;
 b=jL/P5YOG0lECwJf9VRUedHvW9yOnPuNqtM6Fdr2Uj7BuyzxxJALyIM4bzRIq+OLDvBHZx
 VKKU+4MtSVDvk2m1MoOZsXMKlfo8ld5jUM20zU3FzK5wJBwqF6cCcGHxc0WVCIzq+WcvTcz
 YdjynuoV3evmhDQj2o4PtkTaq2VvNnD6JX3t4oIwr9MpSWAIdNKcyHg6rNQ+pUYcITRki8j
 SrC3FpZt9tf8A2iN8eS9+sWVOD6p+bNJ0CsWu5rC4k44C1CNploW+i8TxolZWykPz8FkgI+
 F6jWDupDlOr/ynexyN8b4xmsysdnvZPMCW9aZ2ct5iBIhApYd+Ayqja9dMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768647669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uLT57iVuc58koXZhJAPKpYJNplINGS977h2v/Yo8aBc=;
 b=pcYbN6g9yYL2h0uEbwoq8DBTZzN94bHUdRbAV0J9XbmzPOZBzmX1fcdqq8qIvItZdJ31d
 G2BD19UMnvrMRhu1zR2vc6mptFYIt89/5UWw16P2nX5Do0MzVO/dFLNiflpCXvTz0HnK44v
 EbfwSiKAFabv/lAP135SKS9jm5gP2RVVVK44L+bOTZGdMBGOvAoG52kTNYqC0HslTPkdAs2
 bm44/guTEZK9DPfaeSKf8czw37KI/6R83A2iic15dYUyAIsRhPdCQ/dKph3Vu4/NlBRTq1w
 60bFg3lGZ2JE+Or8sKPBV3fLxb+ite65kfUBYpJPCZRlUfOXBCsPWfDtGTbA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CA5BF44C9B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:01:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DADDC10E0AB
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:09:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BECA360127;
	Sat, 17 Jan 2026 11:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E746DC4CEF7;
	Sat, 17 Jan 2026 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648183;
	bh=kbE1DSqN+rccLY1JWsgg75NViBt2CK/o9u0y2a8INzQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fem9nmkEeoHe32FoOTZ7ThwNLLg1lks4gJLIj3E8dH0Cc4VaICGuihZkukhBl2AOO
	 pCHfcNlf6PxmBOk9H7R2gXhEi9QzyVDdXkZe/W6IEoTScxpfuu8kGsbi5rhbCRgPy5
	 EybTH280Yy26EKH/n+7NScvodYAjERPychBdGT1Fh60sahuc2rmiQNRiOrHq1bP1hB
	 HDi9FlCTu4xE0Xs3EqQhccM1T4KijwcV4fd/jUM6s6lozK7Q7yfuVSx+C3K3grWj0X
	 x+6pQ8gGmMjzYiCOVhiQBYNdycPrr7qldzYXaLuZfn0MI1SP7Dl4ugEAnYEqrWgk7Z
	 qvoGa685HZYeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:09:39 +0100
Message-Id: <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-2-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-2-ttabi@nvidia.com>
Message-ID-Hash: VDS5FPKLNVCMGNU4ZQZZ65WNNDIVJLB3
X-Message-ID-Hash: VDS5FPKLNVCMGNU4ZQZZ65WNNDIVJLB3
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VDS5FPKLNVCMGNU4ZQZZ65WNNDIVJLB3/>
Archived-At: 
 <https://lore.freedesktop.org/DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name, typically the BDF address for PCI devices.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/helpers/device.c |  5 +++++
>  rust/kernel/device.rs | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index 9a4316bafedf..4609b62f6a06 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, vo=
id *data)
>  {
>  	dev_set_drvdata(dev, data);
>  }
> +
> +const char *rust_helper_dev_name(const struct device *dev)

Please add the __rust_helper annotation.

> +{
> +	return dev_name(dev);
> +}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index c79be2e2bfe3..636c522a8374 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -483,6 +483,22 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_ha=
ndle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> +
> +    /// Returns the name of the device.
> +    ///
> +    /// This is the kobject name of the device, or its initial name if t=
he kobject is not yet
> +    /// available.
> +    ///
> +    /// For PCI devices, the name in the format "DDDD:BB:DD.F" where:

This is driver core code, please drop any details for PCI. Also, the subjec=
t of
the patch seems wrong.

> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw()` is a valid poin=
ter to a `struct device`.
> +        // The returned string is valid for the lifetime of the device.
> +        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) =
}
> +    }
>  }
> =20
>  // SAFETY: `Device` is a transparent wrapper of a type that doesn't depe=
nd on `Device`'s generic
> --=20
> 2.52.0

