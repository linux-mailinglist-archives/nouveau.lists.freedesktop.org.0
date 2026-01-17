Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBDBD38E82
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 13:29:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12E4410E0C4;
	Sat, 17 Jan 2026 12:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s8r7Yvn3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 63A6144CB3;
	Sat, 17 Jan 2026 12:20:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768652438;
 b=OqxOoOUQrFGko71WETe7wwpv3JjAKeAdgeglp3WA8aAL8i50Pvos9EeiJBJb30YLYTxmp
 44mxv0X0Ags1W4No7KrsNxNpEwwatJuzBpDmmOq1xrVUSOCD0jo48kp1mVhsUKQ3VXCrzdm
 fMAR60Pt3rQCHLzkkqWHjYHmLNlwNyS1WUzpwXMrCNmOqJc176x2SgFb9WeiJVkaK3lZEe3
 iu0DIi0lrEEXSKNpteIKpOBCLoNKFHP2QPquKZmmrgfT1QTNHJgA2na8WdFHo8AAilyqK9W
 ZEy6P/QBOtxOxxSMtbaRXmBrjIZY06Ycjn1bYmCXH9zwHgbSTE46bO7D5elg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768652438; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=32iUiC26EcXq1wj4PsiWzSl0d2c886R/zo+oH0Td6hQ=;
 b=RSiS85JzSdsvUfcwJRPmuR5RnSM6XmI4/lExqlwCRco2pLwrGCL6iijAtU6G9EDp4ysig
 +3wW73iah1cMNRxpo1YbTBbkP6paQmbBlnmStMZgYxBbPDBP34kFFvSG5mGgDhHmiZKIydJ
 7mfB8nczcLBUOfpEI25dVOQIp7F4ZswKJKV69r+rMrIeCEB+VR5XqSVDuw3BkEtUf1e2zk9
 VQZQxo9aN/ZDNS2uc/BsYWwW1xP/6D8k07xaZGEzt4RzhRhG2K23W/O9Zs7zLG9L8cmBgRd
 Y9zgI/MO+9PWyfNIoXvBk/cWTFReP5rvxNP9ytNohjpAfhvNMhmdE4XV1cng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2095544C5E
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:20:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 62A9E10E051
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8859860127;
	Sat, 17 Jan 2026 12:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0386C4CEF7;
	Sat, 17 Jan 2026 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652952;
	bh=HG5hgAyjnHeCRKwT0pEgowcnSPcvb6xXyeze46219Ds=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=s8r7Yvn3xHVTo++zcQUou7S4ULij0ReQmIQdjc1xUgYxx3ph6gOkmrRVmirYG8CXP
	 iRyYd4O525223VBAxmKoQC6+4YYyeG563Usjq8bF/M4EAaakf+47w87Ha9ilCQUlvm
	 0ztMIq2OAfrCIs6SCl7udctAWWKquFjy2DXM0HHB081PnXN565lhvlKYAuS9soV8Ib
	 X9qfRBNTNf1yhEKHZf66JCwwu6fFsEdJQbkLOWsQXEB2LzfS3ZS53TGz41l2WSALYW
	 OL06EpySiQUlEr1vzx8G0aCk4YzQVV44ARYI6Mke7tSwzVno0p+CWvmPjSnjllDHK3
	 j7jocZAJi7tJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:29:08 +0100
Message-Id: <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-8-ttabi@nvidia.com>
Message-ID-Hash: A22E6TIGK646KAPVGYTBEP4EBSPYBYQC
X-Message-ID-Hash: A22E6TIGK646KAPVGYTBEP4EBSPYBYQC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A22E6TIGK646KAPVGYTBEP4EBSPYBYQC/>
Archived-At: 
 <https://lore.freedesktop.org/DFQV57XCLMB6.1A0IW206EXE3H@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        let dir =3D Dir::new(kernel::c_str!("nova_core"));
> +
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT =3D Some(dir) };

I think you forgot to add a new Kconfig to nova-core to enable this and in =
case
not set leave it as None.
