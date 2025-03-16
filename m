Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57335C8724D
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 21:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDF610E4B4;
	Tue, 25 Nov 2025 20:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=proton.me header.i=@proton.me header.b="br+hPYt9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416110E08D
 for <nouveau@lists.freedesktop.org>; Sun, 16 Mar 2025 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742148087; x=1742407287;
 bh=tAOyqqzV3U1doRz6F+tF1ZAeoLpn6CDfC6jWDliUrEo=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=br+hPYt9Gnwa7o6IBCW88llVLpCKrhm1GWAa2kho4+eWWTBZS+6S+ubbKlEWppETU
 RAw9A5p1vS8w3QiwmwAkDMufLI12hL6tdt3JVJNO4c9T/OskCpr/dealfBc7Vf7w7Z
 AcMQpB3mxJRdx7/zzZ6AyphoU3rvhuaUAZ5zgM2f3Oaueb4+JimxwN0mIOpMtcOhfN
 dip7LuZI88MW7P4jIdzFCMmtLWD2Um/0oIXMwQEDrAETEIdXnI+zKCoxt+Vvini2Mq
 +VhEZC/9B8C5JHR+jk2qxrJaZEWcCff2YaPaqVJna4WLKcsVlefSZJ4UOcvuhKerlX
 uiiFEnDxfCqcg==
Date: Sun, 16 Mar 2025 18:01:21 +0000
To: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
Message-ID: <D8HVY5KSXNRL.YPQRJFX9R8XQ@proton.me>
In-Reply-To: <20250316111644.154602-3-andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6851ab4816f7ad4e9864ac4c422a20a36671b293
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 25 Nov 2025 20:47:20 +0000
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

On Sun Mar 16, 2025 at 12:16 PM CET, Andrew Ballance wrote:
> implement the equivalent of the rust std's Vec::resize
> on the kernel's Vec type.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

