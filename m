Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4CD12D41
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 14:34:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 229DF10E3CD;
	Mon, 12 Jan 2026 13:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OCI/5MDw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F95044CA9;
	Mon, 12 Jan 2026 13:25:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768224334;
 b=M9b9+XpABsiwInxAvP+hC+Y9CE/MrA2LpMkjIEqYhV5Qki94wKTtoSfVEKnLuKXEgaAOo
 Tsu6C/8rO/lWUY9DpehdLrm0ordVwvGfNRx1IRpyrJJyzERzyNVsemdkXlTdA5djjJvWZT8
 +2ieg2M/rQeg1BdB9OOIgrTawYKoCZEbzTGnN8AxzpSCmXae3veKUEk/is79awUna+T89IN
 37PLIjfTsjAKc46kWFBjK/6+bcpnvBZx+Mt0g00l/Rl3QPsW/7BgW2i5vMu4vbsoweAWbW/
 ByoOT84tTd4/RDSmWZ0BgkSp0fsqIiv6s52gbpfvq4uFddYlo0mUJvdTr7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768224334; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=onfZvVVX9+CAk0xUNla+k+cH6hihGjopefsc/nm40sA=;
 b=ClCUu4SABZXaHuxJpS82QdH4n9CGI6I6lhY745cnH1MHgcyeu95T+DlwXZyTiAN5H23tJ
 ZBP7/sFqTNqJztT/9LW56g0QhdBWWH0EKH1gjUQzmZ+msvz62gNBpKsJyjGSxM3psDAdN7K
 aREjBpa1pbsJMF/2hEJRnckKP/NAH2+6gQdd66OhCFCzU9HCaie+DrktMEnmu70mYnYi+hT
 ILx2bzV2c3dWhurs64biTcWz+gX6jsjtW2BuSRD+cPnQ1mwXK2Rqn771FQna9o3yXJ7gg+x
 514F/X///EZQudBPm2gydNdIiFhS6y6RGTqihq4cw0BOm0cXtJ+rg8Dqee6g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 598BD40382
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 13:25:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7010E0F7
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 13:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D01160010;
	Mon, 12 Jan 2026 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327C6C19422;
	Mon, 12 Jan 2026 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768224836;
	bh=hqbpLXwODEgF9JoNL1u0dr3BNsXBfOK8Aw/YSrycNrA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=OCI/5MDwRMfbvWnpBctMCgohVrOoDtwK5xkR/tHgmcloHSyUJ8Gb+6ZrVoDt3y0oy
	 RYq500rhc7pNNzBD/kuBGd1yM1YAMe/koNnaMUERyvVAku5gfOsgYmWP7Sifw0dUMd
	 2gw9I10NxIlvb5Wb6fXV/Q4gyQN/ID+RVQlf2RUo5xhQR4DQRAfD5ilVVoTRr0oS/v
	 N09BYRjSWmI4ly4ePZfSYn+SxhtjwibvfLm26PUaVasOqCi6X50GfLIdv1AZxW04Am
	 ODfDzwG+ab/s31le52eS19/GhOhr87Tg5k2tcSAbmlamFlQk3g66vl0jaFtKgNUAKI
	 uEHbs0vObuzOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 14:33:50 +0100
Message-Id: <DFMNE0WSW2QR.UWZGFHOWIAL@kernel.org>
Subject: Re: [PATCH 0/2] gpu: nova-core: gpu_name cleanup, PMU debug output
 cleanup
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260108005811.86014-1-jhubbard@nvidia.com>
In-Reply-To: <20260108005811.86014-1-jhubbard@nvidia.com>
Message-ID-Hash: VISALZCGY3G6RRU2XSWNWZDOXSNV3NS7
X-Message-ID-Hash: VISALZCGY3G6RRU2XSWNWZDOXSNV3NS7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VISALZCGY3G6RRU2XSWNWZDOXSNV3NS7/>
Archived-At: 
 <https://lore.freedesktop.org/DFMNE0WSW2QR.UWZGFHOWIAL@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 8, 2026 at 1:58 AM CET, John Hubbard wrote:
> John Hubbard (2):
>   gpu: nova-core: preserve error information in gpu_name()
>   gpu: nova-core: don't print raw PMU table entries

Applied to drm-rust-next, thanks!
