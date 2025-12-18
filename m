Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106DCD0ABA
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 16:59:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB46510F03B;
	Fri, 19 Dec 2025 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rmtKthG4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D7A7454F4;
	Fri, 19 Dec 2025 15:52:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766159535;
 b=G/z8FqTSy7nPzenTeldDer2nTE0JyoYtVZ7mlVL3g8dT/exJFrV7LgA7MsdjZi95suKjM
 o28w2gX4cOKmN0DZUTfyovZ+p2iCOp64YWy6tImkrme9gV3U4T6yeIqA2HogPgrb9y7sxTq
 AfvaZhWwrZE+gJvaB3pizI78tTK1bgnrjZtJmxlMVyXwfDSvVDRtBzS7aOTaAqO2myoHHCC
 hHP4Q4XVbpUEoZJ6BjoZB8KiXLfcRHATuVFj6fDsrmWdkkP5VQ45yspwKbboPIQcWTTScUW
 LQFZCk6Df+2BOMNOtDfYGfcCDmKPriEJ8j7f9TvLSS5Ld8QC7qTAEI/Kz5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766159535; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ixJO0hu3i8cJobG3c4G/ECbCHJ9nWmL7QeH2/4xi6PA=;
 b=uk3HSroXtjQPVo9Rn0mIT2ljYuYS3mwBvHH3Jm4p8xoDjFCs34yoNst+uFjjrjj8fEAYx
 pNrBf4mb5Ju8SgVG6rEcbV4gd1td5tSDjvkDXBG5oeUNx1aoRaBPdhysv+wTYk+b49If85/
 B4DoEpvYMjltbvACgBiIK7b/6e5/oxZMCPt7SJjkwglrwfOLFXrD2eI81PypRMFSzcCHzst
 SYA2JIKossdK581+mkkvc9T6Ye+lV9eYqemVUSlC8z+92dQMwBdm62hlMSpy2agSnbRFjAe
 E/zSCMijSoIDeZ1mIWOMVntYv51Hl2X62z9NHnJ7MKskkk7kg8mg+M06mGKg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DE3F644B8D
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 16:30:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE72810E80A;
	Thu, 18 Dec 2025 16:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F242660010;
	Thu, 18 Dec 2025 16:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31901C116C6;
	Thu, 18 Dec 2025 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766075875;
	bh=ixJO0hu3i8cJobG3c4G/ECbCHJ9nWmL7QeH2/4xi6PA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=rmtKthG4N75e7AtksrHk8MSlRGJ5S3zbRUQIQKN3ChxSzzwZmbTM5vghy6k/uqhT8
	 7u/QOGX3h6jlBm7TTNis2wHRwnoQfOHhbvQ/AlfDdkuRXr8gEwuEjN4DVex09gDzCb
	 pBYbnIP1nePsyj1v9XJOM+vHPwr5jjx6a9Ti2pEpPXDj5U8thW9sCbQKn34Pn4coQN
	 oSBwEldbgTPWal2DuI6OII4H1P9CKnbECHAiUgRvS3YXb5iD5ygNQIaDwFF289J4sV
	 s8/cwe1HNHvx0VydgWR2fhSMbHI8zyghZDq/xVEzQLup5rlwVAptrNbfVOI6dayFhy
	 l8LPGvL4BcIEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 17:37:47 +0100
Message-Id: <DF1HN90AG0R2.3TQDS8IQ6ZP0R@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: "Shankari Anand" <shankari.ak0208@gmail.com>
References: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
 <20251205184023.7230-1-shankari.ak0208@gmail.com>
In-Reply-To: <20251205184023.7230-1-shankari.ak0208@gmail.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: GMYSRDGWDSW7WFWK7J75VP6CB7GDVUU4
X-Message-ID-Hash: GMYSRDGWDSW7WFWK7J75VP6CB7GDVUU4
X-Mailman-Approved-At: Fri, 19 Dec 2025 15:52:12 +0000
CC: Igor Korotin <igor.korotin.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GMYSRDGWDSW7WFWK7J75VP6CB7GDVUU4/>
Archived-At: 
 <https://lore.freedesktop.org/DF1HN90AG0R2.3TQDS8IQ6ZP0R@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Dec 5, 2025 at 7:40 PM CET, Shankari Anand wrote:
> As this patch is part of a series, am I supposed to send all the patches =
with a v2,=20
> some have been acked by already, hence I had the question?

I suggest to resend the series without the patches that have been picked up=
 in
the meantime.

Also, I suggest to change the prefix in the patch subjects according to the
subsystem they target. For instance, you patch updating the USB stuff is na=
med
"rust: kernel: Update AlwaysRefCounted imports to use sync::aref", which ma=
y be
overlooked by maintainers.
