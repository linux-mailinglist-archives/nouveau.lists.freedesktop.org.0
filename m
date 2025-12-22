Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9CCD9EA3
	for <lists+nouveau@lfdr.de>; Tue, 23 Dec 2025 17:15:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 712FE10E279;
	Tue, 23 Dec 2025 16:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="adNhm9LB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 20BAB44C56;
	Tue, 23 Dec 2025 16:07:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766506054;
 b=ojkPyDsRVxLr9B23byIpyDHgMES/BLaKCwFVhRsNIiJQ4j1mTSzsn8l002UIw7YgRA02H
 0S3z09Ra1Pdlas3Ob8EowXnVU/Vwwnm1n0DVz9xbNCOAWlYVCD9q4aq3TrIRtbcQ0oUbPfV
 Vji+tI3jAmdhH8ZuZ/OaX9Z1p+tjecgWHSEsBPrahX8EkslKLfsbEHwgqeZ/oMqaHLAd49B
 aQmIEavcK+WGmKUuPyVhZqBRBA0h9IGJ73LZHroVI6/pfVhgDVXhtUnUlOGDoEJwsxg1uk5
 O+IxNHpopwazlUTS9fCqx9LMvkEPddOgApHsWqljv6yf+m9Tt9hWJByn/4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766506054; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AsyulULgWGbep5UGmr8dghyW26wvvR/zQhZLIltMtrI=;
 b=XX/wpq7WjhN0oTrSgx7SgZ6h9uL2m/wcUGdwzvZBrLyRkKVzqksFK2Sf8pAebkll89tV6
 hUcLm+xqDCa4/O3mLGXoLFi9cvDSiAcP7Rc9tqykni9j2Bfic/kf0+gr8AhqyYhwstK/8nz
 EGJuLQDmQhQRNxDW0v2j79emy3x2BmqpZdXjoiHkggz4LNcDEGlu/9Ax5x1W8VYuU1JTWZF
 hXFN4vJBmmOxZ1T3PHrPfKNYu6LCBT/Z/230JHVUUavvMxT895y/E5S2R95rM7sIE60APAF
 oU3Qyxolgx6eto0oxIPRMMpDpMXdiznN1xtioU5tTwisFjuO3/t9WuApODcw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 57DDD44C47
	for <nouveau@lists.freedesktop.org>; Mon, 22 Dec 2025 16:50:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22D4910E08E;
	Mon, 22 Dec 2025 16:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE33B6014C;
	Mon, 22 Dec 2025 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DF3C4CEF1;
	Mon, 22 Dec 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766422711;
	bh=Jt8y+TLci5YpF2GwIQAC9U6va+XnEFxp3SVTV8kkOAQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=adNhm9LBUsrrX+DenP00f+d1onGx9CMbQVcwRi+QychBpcZn9LpCuKw6hY+hG5FZh
	 YDkQ0AOnOGmYRdKPr06ZAibR+unUh1UU6EL444/AY0820H1u69EnJUHuHI/loBTXO2
	 fDLze0vpoHFyr0dzMySitB6+zAsHueo/AT2zG2jndQH6PMUHQV8JafK/EDX0VZdKQX
	 8uZdRnQjkX4vadyNmLXoRNLEV931OylnXYIyKsO36YnzV1p8l4qVxw8utcZ/Hl0hba
	 TQ9hEtIVzvODY3xA+WtWHHtUOfs0nC4I0vDTQnr52s9TEN6m2ypPvdqRLIMuDULupT
	 /T8BPZBrZsBXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 17:58:23 +0100
Message-Id: <DF4WL7CPEB0G.34Q08IOBC1I5L@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
References: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
In-Reply-To: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BNKSK7UJWDLEOPHTTWUZZ6GIE2FGS5F4
X-Message-ID-Hash: BNKSK7UJWDLEOPHTTWUZZ6GIE2FGS5F4
X-Mailman-Approved-At: Tue, 23 Dec 2025 16:07:33 +0000
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BNKSK7UJWDLEOPHTTWUZZ6GIE2FGS5F4/>
Archived-At: 
 <https://lore.freedesktop.org/DF4WL7CPEB0G.34Q08IOBC1I5L@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Dec 22, 2025 at 1:20 PM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-rust-next, thanks!

    [ Use 'nova' commit subject prefix; use kernel vertical import style.
      - Danilo ]
