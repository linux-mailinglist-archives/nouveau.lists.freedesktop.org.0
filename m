Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F0CC2CAC
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 13:34:33 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C093410E94B;
	Tue, 16 Dec 2025 12:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mwArkI3A";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 874C0455A6;
	Tue, 16 Dec 2025 12:27:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765888025;
 b=UU8jUXRZEH54xP5dlZudJyWrE4NMXznG+drqyboCB4pmxisaZ33fekJkYZoxM81dTSfqb
 kt1nMEIYVlwRjl49ux74e4/NuoyrFU8sL81I99wkIzJecO5mWJh3wDeL9m5o5/pKhQjgsSX
 TeggghMscV6OVYk3AoJrB4cHPQvC/a5zzuSXXDvlwqEgjZdd4hhCd4sWzPVKxtz1y4BHEQS
 ZRQFWaIK4U1k8nYAcANcwUmXNlut+1W4Zc+PVKQAXCh+zjvpLTcdFLJGktl9JZc15X3+xZ5
 1MdtkA42La+n+KJ9JMF5U7f1Afi76ddL2jGNdr2QzYUepPYaTmm1XJE/3v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765888025; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HbGAkd6dqdlZiP/JqSbSt4Qvo26pgom6ewHDRcS2SXY=;
 b=ZwY26cjkyXhyBs+GugGrMdpySDPNOMt6W3Q+z6c8EGe2t+joLSs/oSTjHTLRb7N3L1ZLT
 mPqEVQ7MIBxsEQr0boBa2toyPPczKW/5cfksxNG+1nxh1u+F8mvyvR4ORzNM6h9yLWpeN7I
 ujRsTrcSsI2EK3pkjABUvAc26FXdanTdprM5aFFtGwsyxAVhTLI3wgjN74QnhGan/wXiID7
 KYn0aLNR0+WpOaW3B1MpGmvqWd2F/b3PwX/2dC6jcPImbEYDFKTy+xLZZjsfXv19zAyPtT6
 +tQsMzVtNzCa2i89iAHREQgrfH2lHj7RehO3FXvXy56/SQkW6KxVyAXUviKw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 554724559B
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 12:06:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C78710E5F6;
	Tue, 16 Dec 2025 12:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2100341867;
	Tue, 16 Dec 2025 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448E7C4CEF5;
	Tue, 16 Dec 2025 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765887247;
	bh=pZP2BYvtE9bxefV3Xhyf3JysEWckorGNQUlBT4sl0HE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=mwArkI3A22We2dV9k1nt+llKSV/PdjOlNKOSh58EWc2WT3tKVntnnU6I/YiUggG3i
	 Tqh2Avr7N+p89KUHE18Db1eNRQr79btWxbHXefSDfhZbHyPA/X5xWRI6d6bq8M/40R
	 iV8mM+xU+ytME+2AjSpNZGzkx0IfVa7eE8uf0+3iDgrlmtU4sIq2ms8QUuDz+/wK8P
	 m4yWOoT3dvUDqi/WRJE4SvI7m8geXpOuHNWA1S5VFcizIh/UM8imRRxIg0GS8i499V
	 jjoKi9KwaPezhIb7cI2YtgnG3oibWCi65T41bi5MZzcwoSs2uqWgnMrLLbCZakN2of
	 +r0DoPlVFuRgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 13:14:00 +0100
Message-Id: <DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/7] rust: pci: pass driver data by value to `unbind`
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: OVW3P3TFVVKSVJFGEQQ3BMSNOD4DSFLW
X-Message-ID-Hash: OVW3P3TFVVKSVJFGEQQ3BMSNOD4DSFLW
X-Mailman-Approved-At: Tue, 16 Dec 2025 12:27:01 +0000
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OVW3P3TFVVKSVJFGEQQ3BMSNOD4DSFLW/>
Archived-At: 
 <https://lore.freedesktop.org/DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 16, 2025 at 6:13 AM CET, Alexandre Courbot wrote:
> When unbinding a PCI driver, the `T::unbind` callback is invoked by the
> driver framework, passing the driver data as a `Pin<&T>`.
>
> This artificially restricts what the driver can do, as it cannot mutate
> any state on the data. This becomes a problem in e.g. Nova, which needs
> to invoke mutable methods when unbinding.
>
> `remove_callback` retrieves the driver data by value, and drops it right
> after the call to `T::unbind`, meaning it is the only reference to the
> driver data by the time `T::unbind` is called.
>
> There is thus no reason for not granting full ownership of the data to
> `T::unbind`, so do it.

There are multiple reasons I did avoid this for:

(1) Race conditions

A driver can call Device::drvdata() and obtain a reference to the driver's
device private data as long as it has a &Device<Bound> and asserts the corr=
ect
type of the driver's device private data [1].

Assume you have an IRQ registration, for instance, that lives within this d=
evice
private data.  Within the IRQ handler, nothing prevents us from calling
Device::drvdata() given that the IRQ handler has a Device<Bound> reference.

Consequently, with passing the device private data by value to unbind() it =
can
happen that we have both a mutable and immutable reference at of the device
private data at the same time.

The same is true for a lot of other cases, such as work items or workqueues=
 that
are scoped to the Device being bound living within the device private data.

More generally, you can't take full ownership of the device private data as=
 long
as the device is not yet fully unbound (which is not yet the case in unbind=
()).

(2) Design

It is intentional that the device private data has a defined lifetime that =
ends
with the device being unbound from its driver. This way we get the guarante=
e
that any object stored in the device private data won't survive device / dr=
iver
unbind. If we give back the ownership to the driver, this guarantee is lost=
.

Conclusion:

Having that said, if you need mutable access to the fields of the device pr=
ivate
data within unbind() the corresponding field(s) should be protected by a lo=
ck.

Alternatively, you have mutable access within the destructor as well, but t=
here
you don't have a bound device anymore. Which is only consequent, since we c=
an't
call the destructor of the device private data before the device is fully
unbound.

(In fact, as by now, there is a bug with this, which I noticed a few days a=
go
when I still was on vacation: The bus implementations call the destructor o=
f the
device private data too early, i.e. when the device is not fully unbound ye=
t.

I'm working on a fix for this. Luckily, as by now, this is not a real bug i=
n
practice, yet it has to be fixed.)

>From your end you don't have to worry about this though. nova-core should j=
ust
employ a lock for this, as we will need it in the future anyways, since we =
will
have concurrent access to the GSP.

[1] https://rust.docs.kernel.org/kernel/device/struct.Device.html#method.dr=
vdata
