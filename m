Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6EACF2931
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 10:03:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA22F10E37A;
	Mon,  5 Jan 2026 09:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUlXDEQL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2540544C90;
	Mon,  5 Jan 2026 08:54:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767603298;
 b=JetanxNAbPpdeDL415EE6TPA+zcwlBvb8JpN9zrdDjWZnRs/u81kuYLAceBdynfiSbB4E
 OICHpP/NWz9vuYQp2tkh1/6LbGD37hXJR/seRcbu+inEh5d125QMW8w4B68IjCBmiapzQbW
 K5fVXucgTB+6J6Ui2YoSbypb5imCMS9vmpKyoKUtRxfLUpGzJ8aX1NTxtTvZ4u5hyiZKR9v
 /43G0BjTS4MD4Qru/PKLI+5EM2MGG7U+S1RA8CQmn4egBcBPaUVLu8EO8/Yt8rZaLFD6xSl
 BQAT5LB1BBBfIlC2AhGDdmCPW/xjf0XH4V+pKtLDtHbv/RFdpX1qcS0nvvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767603298; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hQKQqf0XNddjb9YejW3b1d1SxgS6yh1IykK4DFUafsg=;
 b=Bdfp7SP0sxVByNACKAJRTuryYji42pmC4otMEOcRLuUiRzqm7GLhVvu4hh1Fr5uNwzTVB
 XvmOeIwaSPzgcIaYgX056WYZkVYZ7ZQJ0ghgYILTnvt6vMw3+COyuG3lIh5uwzz0QO3jVF8
 5EZ9tlUzmnD3yGuXGCLCaaHiyyO+Yr/DaohQZt5iGycXCtu1/WahQ6+e5iElcKl9T1j8oMt
 /tFFgDVwV4+PK+zUq2FR/c8NzdKzcOTVfAR2KXVH0F2XL+mKol8DlM9ghLRtV1H2Ckt7IMP
 xecTdE2S94ijd4O0cnH8cXOo7mTrj6OPOOLYIoak1WSTIzk/FdYbY7INtWLg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D830244B9E
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 08:54:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4262B10E221;
	Mon,  5 Jan 2026 09:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7DDF40479;
	Mon,  5 Jan 2026 09:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8BC19424;
	Mon,  5 Jan 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603785;
	bh=nDxFzRZrQadgSgMbm93SXcyEn3h84RlGVDadBNlZ1hE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UUlXDEQL2A9Ic+Wn0J0ClTK0vl/i2UeWaoUZgiNowFJeCtsUiUcpK5ybYc76HgqZD
	 um31MMazdkRewo2Q2lssZ1qdlVi0+QlQwlkaeUZtf4/u3YKu5QpRI1iUmA0xy1nu7B
	 o2Oy4tym1Xy33GAOPlKZiyUvmU6KxlSCUU6YcMKBc9qnqXRaSFHaJcoBCJB66FwUDz
	 hb1N378SCb1fGVBbFDxg5+VPL/I278T7iAxe4nmWNfEP3ZVDZ0w4/ylcuCrzxdP12t
	 XS7xzDh+xrU4B71cvl9asrb5dVbOXY1aPSAuRZ3zXWs/IwYt55evX2aGaGCH5WCZg+
	 oI7Sap9ccR7vA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 10:02:59 +0100
Message-Id: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>, <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-2-mhi@mailbox.org>
Message-ID-Hash: VGDRLBJZLXKC5PDHJ43HNQKSYWYGLCL6
X-Message-ID-Hash: VGDRLBJZLXKC5PDHJ43HNQKSYWYGLCL6
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VGDRLBJZLXKC5PDHJ43HNQKSYWYGLCL6/>
Archived-At: 
 <https://lore.freedesktop.org/DFGJ8UBULO54.NRW84R2DTHIK@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
> Add a derive macro that implements kernel::fmt::Display for enums.
> The macro outputs the exact variant name as written, preserving case.
>
> This supports all enum variant types: unit, tuple, and struct variants.
> For variants with data, only the variant name is displayed.

I don't think we should be adding this. Display is designed for
user-facing output and so it should always be carefully designed and no
automation should exist for it.

The use-case in the second patch is also much better served by either a
manual match on the enum:

    impl fmt::Display for Chipset {
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            match self {
                Chipset::Variant =3D> write!(f, "Variant"),
                // ...
            }
        }
    }

Or by adding the respective code in the declarative macro already used
to define it.

Cheers,
Benno

> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  rust/macros/display.rs | 52 ++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/lib.rs     | 42 ++++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 rust/macros/display.rs
