Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258E6CFDF53
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 14:33:47 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDF10E5D2;
	Wed,  7 Jan 2026 13:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dT5UdRQg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 163D344CAB;
	Wed,  7 Jan 2026 13:25:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767792329;
 b=iNs6Np5kdMvqYYJWpKiFveWK8jt9X4DJm5FlrEa6NQxkXKGqXc3TSG3BGpEIEwcHsjPyy
 wb7bFyHpJTv41YjuHebHpHAlOCBGfTAVMoZNJro2Mv3RhU+zsyhpqcs4CHT7j2WyCUj8H4a
 g3GwJ7GWLl0dLgyPtTW7Ph8kj9KMlOyRNM/HC5j5je7fKNLuSTcIR2emJkm/pT92Oyk4E+N
 uQ7CCPS4PUwa2z9PjwnRJeNiLrCO80DJAalCoRFnDM8md3NSCdjXqXGxDoQSP7mYy9NGXVT
 IdXrHnlDM3JtqAccub4BtYWVyYeNOSaoKH3OKH/s0lKw1Yl9FtmyN3OeUR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767792329; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=59Oo21/enRqCddzigs+wTzb1GNY5X/hahljFjen+ero=;
 b=qa19oqHvIxjGRBDa0JLY4qdCabnTj+tzChSXF8vtVQBZV9jvqk7B7APPAdneeBsP1OcFF
 Sint8LFag/16GXgvTp0pz88aZpp6Juac2vwT+Ci4uzcePnfuKn24m1KxhRiDVYiriEIjcFi
 81geuDM/lYB+tfPux2bMR009GH8WjE2cNOE8quN269xi9HkcQS6ymig2x3vIcqk6EsOmrqk
 U9/k0fYNiUrI3A4L5XqxeqHk59WfHXrDFhqgCggsPgy4mEnvuixmRk+cNQsm6/AvZb+JkGF
 5ZwPP2Ny58AJREoHSTDPY5oWgwJo2d8tySSLwg/APMNnFF9HbLHhl7UsdFnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 64C7E44BB6
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 11:54:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3B710E0AE
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 12:02:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E899543495;
	Tue,  6 Jan 2026 12:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8139FC116C6;
	Tue,  6 Jan 2026 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767700977;
	bh=RuR20ntLSihU7i4U/Z71FOOJsBvzHsUKXpYAf9QNo5k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=dT5UdRQgmJpc3yEWySg1nUr+5EtLuryqgJyy9pbNyBaLQpno0fhxEhdzeIt4pN/ML
	 w9ZF8E7JLB0/JB9yEcXOkRobNbwpKwhw6k03fNG93N5lDTUSTY/fnHMPU/hDPaq4DI
	 nVc+pOhH+F935WDEJgQ3gFrYl7VTMrTEPC8vqXSZ6JkE8I/7elG78/psjuEqKFikBE
	 DRE70jAe3Kwa2HXf4OnCFnsW6x3JPbKHOMnDljTV1jWYkI/EOABWLfo94LI+so71CV
	 +j4dPogSIz/7hU0VXC/a574quUxWu0gAiPNgX1YjKDA4mvy6xsi6gx1gknsLaHtpNQ
	 GmsJby6TeLrXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:02:51 +0100
Message-Id: <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
In-Reply-To: <20260103013438.247759-1-jhubbard@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PU3FA7FSL7CBQ7FPUA7G6LCMXBL6V462
X-Message-ID-Hash: PU3FA7FSL7CBQ7FPUA7G6LCMXBL6V462
X-Mailman-Approved-At: Wed, 07 Jan 2026 13:25:27 +0000
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PU3FA7FSL7CBQ7FPUA7G6LCMXBL6V462/>
Archived-At: 
 <https://lore.freedesktop.org/DFHHP3LVYW43.247TW37BCGYHE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 3, 2026 at 2:34 AM CET, John Hubbard wrote:
> @@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
>      /// Returns the name of the GPU as a string, or `None` if the string=
 given by the GSP was
>      /// invalid.
>      pub(crate) fn gpu_name(&self) -> Option<&str> {
> -        util::str_from_null_terminated(&self.gpu_name)
> +        CStr::from_bytes_until_nul(&self.gpu_name)
> +            .ok()
> +            .and_then(|cstr| cstr.to_str().ok())
>      }
>  }

Did you see my reply in [1]? The question is orthogonal to this change, but
perhaps it can be addressed with a subsequent patch?

[1] https://lore.kernel.org/lkml/DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org/
