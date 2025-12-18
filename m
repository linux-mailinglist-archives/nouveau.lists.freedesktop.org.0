Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F8CD0AB7
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 16:59:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBBE10F030;
	Fri, 19 Dec 2025 15:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kyVC97uO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 406D445619;
	Fri, 19 Dec 2025 15:52:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766159534;
 b=V9y5oOxdxbLHt0HjIhRIFZemwfM7yC/PpyLTuH3RPZ4T8rJKDAdRN1K8T+UOOuoUi8tSL
 sgJRmiqAfBwadmIkR5PTuFsrSv5nKGIkhSbS8B9RhVo9ewxQZemtCg/6VjJRt8rMnIYJF0A
 X6kGz6lcXZyuYkPtezXXQF4dQfoUJOL9eQIom1s32dhoPIYEupdMmKhkuPly1AThuegeM3a
 chIgRNoW6jiFzLqN+7bAkzzPYFvn+jEHWobOwImsKAmnZk1GyNxzmE6u8m/B+nUQSAHT0pp
 ZR632wnh48bps6gSXMKQoNwNpNqjxYAnVeRFAcJ1qUvCrMUtqrmqaJGQpfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766159534; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YFvkYn3/vF7G6kEZEteFe0M2PUdR9B6J9yqCwNu0Qeo=;
 b=e6tgW3jbiWDmqZpsEuOXbyUE8rqh9+4Vx27InpMHNuUThKyp7eakj1IfRzEMeKQ9fXGeN
 8ZbPaYVUsJeyY+cFiWBe5zu4FKXi7cHnCC+koB3UKqU961Yx6XwUWZGM4i1nywrtbNue6mL
 rpNrHBKQKzIFLeOpkZ2Vd4iNvtJayDIYEj/v9lW6E6lnAS314IzZpFXLA45M+HrwWayjmSF
 eNrh3zZZ1hPxcSSMXWrqfon3/DrgKQtO5eqxuN2ECiKm3436qUXaeTdDbqJlAWTdTtRXWNz
 JOKkzkeW7a5dcV2Z+6OQo87M5oJFfvohDFF4nQRoVpcRpnftab/nI8bSfcpg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B23EA44B8C
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 16:27:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29C10EA85;
	Thu, 18 Dec 2025 16:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6825B443D2;
	Thu, 18 Dec 2025 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A36FC4CEFB;
	Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766075721;
	bh=NwliGA6POZUo0NrUjyXl5fIIG/7Xk3vSI0rDYbtTwr4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=kyVC97uOZEKzMdf67qIWldq8zHvQOoggsAKMh3mRCsmbVOs1IOjzfhcdapISY2SLQ
	 u2uYBgNI7yYNvMol3FW3OU52sAgU259IW5xXGk1xHMsFjLD6tRPtDyUZuBkzIF16IO
	 woNrUzAV25gkhsdSwvj8dfZvcKUc3lB+pSHF8CFbmIgk5TAsqaCKYusu1CD7UrNk8P
	 a/YEcnhWlvht4VtGc4JJnzQpHR1CLe4pwAUTFf0Ol97OMGHBkln2nXNex9fYkf9lkB
	 kH5gFtkIJnS5Pj5aqqXJ2LqOoTm/I9Dqps+mbXkB7NcE9UrPip0NBYXPW7l4Y+7E4H
	 WCLDHRZ/s8jeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 17:35:13 +0100
Message-Id: <DF1HLAAHBNUF.3H9QT3WIINRR@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
To: "Shankari Anand" <shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: YDSTMN5PVJARIZ5O2JZH34LIVBC7XFY3
X-Message-ID-Hash: YDSTMN5PVJARIZ5O2JZH34LIVBC7XFY3
X-Mailman-Approved-At: Fri, 19 Dec 2025 15:52:12 +0000
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YDSTMN5PVJARIZ5O2JZH34LIVBC7XFY3/>
Archived-At: 
 <https://lore.freedesktop.org/DF1HLAAHBNUF.3H9QT3WIINRR@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Nov 23, 2025 at 10:24 AM CET, Shankari Anand wrote:

Applied to driver-core-testing, thanks!

> Shankari Anand (10):
>   rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
>   rust: kernel: Update ARef imports to use sync::aref

    [ Change subject prefix to from 'kernel' to 'scatterlist'. - Danilo ]

>   samples: rust: Update ARef imports to use sync::aref

    [ Add 'debugfs' to the commit subject; be consistent with the existing
      import style for now. - Danilo ]
