Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E529CFAE1E
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 21:14:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD57010E551;
	Tue,  6 Jan 2026 20:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qFhJkLBQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C502444C9B;
	Tue,  6 Jan 2026 20:06:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767729989;
 b=QwsTWuKKYXkD9RQSurHzWwfPfzPDsUeyv67oUDM5sH84REx6lkRvg0hjteBeiMjjCW+ED
 j1wrv59M/Vz+Un+TCadvDW6Yq6FdWNFnEPDBmTWMzFCjBENSNHhptE0nE64hDfpdtyz0cGo
 WIkSR4CvDsS0+jQeu3+d9BWKT63LqGxT2g9otXD6b8XtuzGHSOUDtgjYRyHZ8yJglbjhPwv
 msb+NcOM6obkApoNLM/vor6076HoP5O3VzVA5RT77z88N4GTFBf3sp4IvTis5LcOpMlqahp
 46SEWGGdkgfH9sxpzsD+eGIW3/usIp9xegJukQRsCh/L9YSKS8qhKqAHq5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767729989; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HVKQFvb1mWoMNFkHbPkDltI2KNOcqjdtTGPtT0azlGo=;
 b=1EEKB3kfH0mEVvQe0Xxo3l5BKWoiv+cfOctZPnhGl1sIqJhkwdw6OAk4+a6/AC5rkkC8w
 FgCASsexhwkixRZEiQ3WFoPVKG8R4NV9IyxVWBxxnbPs1q+rRsalj99+2/N2D3vd+Yf6NeV
 GslBGARc33U5QYiFY6lyJdYyrB6vxFAxi2y8lGjUeoRDE5LiErj/HBAcEokfoqNzz5rezoR
 JoN687egDbUpX3Gg4mOfqdRrD0XdeDiPN0GW/EyZG2KveVsmqL5ums22qicv99egM8+4pYK
 gYKrmrLN1JkHvlQlwvA9JMzgtT20udStJWdn/jLJTJi4melx2igG9KAYRMMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5CE8B44C5A
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 20:06:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0374B10E3C4;
	Tue,  6 Jan 2026 20:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BADD344092;
	Tue,  6 Jan 2026 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76FEC116C6;
	Tue,  6 Jan 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767730480;
	bh=X5Pea7bHPe0DI/5LIu59CR9OThlTHAfYphOoFvHkxbI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qFhJkLBQjWOY6PRgiWE0ViVMNBHW39unXoZfg1BJ6oZhYFU1cb7/ZNNjzAkswlutv
	 7eyqDAp+7984CIersTXmE4LpI5KMgDyPKvpaEWhT+5sh8/eJjJfGIik/nJKnOcIWtX
	 iI7cr8JB/fd4UW5T4mOzw9GQIkUdgObI2tOvkpC80bqKZZP37/ngNxAxHScsP+pC3l
	 JkBLGJkg8oZYU37YH6BnbaHqKTnTwsdfmg0xXajrYhy3C6TUKoJsNt/mHWUQH1j20d
	 DkWJTUzVQPux+0MNvZUlPgVUquUhKKNce3I+J4wgJugjj5+KC6lpq3ywz7e0emHZUb
	 5KZiaaacbXaCg==
Message-ID: <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
Date: Tue, 6 Jan 2026 21:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Kees Cook <kees@kernel.org>
References: <aJ17oxJYcqqr3946@kspp>
 <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TFCTHULELUQGG74S2S6TVALOKIIKRW43
X-Message-ID-Hash: TFCTHULELUQGG74S2S6TVALOKIIKRW43
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TFCTHULELUQGG74S2S6TVALOKIIKRW43/>
Archived-At: 
 <https://lore.freedesktop.org/b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 7:08 AM, Gustavo A. R. Silva wrote:
> Friendly ping: who can take this, please?
For some reason this patch wasn't tagged for applying in my inbox -- seems like
it slipped through.

I was about to pick it up, but recognized just in time that Kees already took it
through his hardening tree.

Sorry for the delay; thanks Kees for picking it up. Even though already applied,
please consider this patch:

	Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks,
Danilo
