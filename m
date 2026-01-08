Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF55D06895
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 00:22:40 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4DB310E7D8;
	Thu,  8 Jan 2026 23:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O6pNd23w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2778A44C78;
	Thu,  8 Jan 2026 23:14:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767914060;
 b=V14/OpKi4JQumEqV9YHdM0fiN3AF5vem9FhERmh6OTnx+BZjG/B3pbvxRT2xTFnL9i1ld
 VtCjWpoCUOvFrL35IkwxNU8fshglu+qPenZGscsm1oNYNtt6Sdq52/W12zMRKAp1J7vj+4O
 cPkt4yQFT0vzk49N82pzgjZD7uFCLHUGPZNHV6u7/pLw4oNTFMIU3fmLK8pUOjYVvScKEK4
 5uDfCk8rajId+apul/RqV1lJtBZMG2mgRKg/MjVBbYMVW6H83BUzjAo5KBK/fqrLUN8+t/W
 8hQ2Q7Oqcj3rDeAbFp7FmpINabTDlcT6VYcwi0dfaDo+0/0A4YzJesgO2BgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767914060; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kxeQjR3bGor3yjDqEp6e1fmhAS66TUi25mHlxEF5cDY=;
 b=NR8jmIIigyngWuxBrazuzOWBnLB//rQ/v+CJbqKNja8sS0hWhjrXUvQO4XX1RvSBt3qUq
 uvKhcdN7Hk9/1I4k508bKp7xXudVlxre3TTI6GDey0ihkP+3GjB5qpmXsq+09/dwCROOHaE
 oLYfQkcAiza7J+5lO89ktwNBymeQfx+tqxUQAPfUmgiAjN5sPu0w4I16ECy7tZJY7cm5ExC
 rbi4Kra2SGclm/HJCqSwjxAYHFMLiASFcArzIAGCV9yDqlfxPoD2s7BXdiVEhkIIrZCG6tj
 qa3qIEJmmPK86ld9z4JjKVhc0bBURRdhuP2n/0eZXwygNXL6R5K+hW5LlYAw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5FEDB41ABB
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 23:14:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A158610E19C
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 23:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43DCF40A39;
	Thu,  8 Jan 2026 23:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F8EC116C6;
	Thu,  8 Jan 2026 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767914554;
	bh=kxeQjR3bGor3yjDqEp6e1fmhAS66TUi25mHlxEF5cDY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=O6pNd23w7l3j/77sIdkXc7l/CsbcmXdqumUGQrMsR7vV7V5fRoRC2WM1lM1G552uX
	 uAU7Atph7xzgCAWroUNMfZAHXMF5AGilQRnn8o7TonDW0y+gStjtrus8fkEGIptv7z
	 bmoof6nk9ryBflQ0XyHLzlv+0+PWrIQ3DHIanJ6yq9VUlKwkA6kJyBG4cI4I95kIK0
	 +JZEnEBgGV2Jzagg4Fz4T21WJN2jtAJHFNTTqaKTND+ZJjI3zJiU9gd9pd/N7ZwN3/
	 9WhfY1Rt3rPXuX5szm38FHi51BtdKhW9kJvIYYucjhNHpsyK/+Nu+G/FgNzJZ68UlF
	 KKkZpjzk0GNyQ==
Message-ID: <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>
Date: Fri, 9 Jan 2026 00:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
To: John Hubbard <jhubbard@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
 <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
 <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PVRDMF4E5JEWNQ43UNIPNSYQ3JTXB77W
X-Message-ID-Hash: PVRDMF4E5JEWNQ43UNIPNSYQ3JTXB77W
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PVRDMF4E5JEWNQ43UNIPNSYQ3JTXB77W/>
Archived-At: 
 <https://lore.freedesktop.org/e15f1221-c146-4fe1-832b-201979b943ed@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/9/26 12:12 AM, John Hubbard wrote:
> Are you comfortable merging these two patches to drm-rust-next? I think
> they are ready to go at this point.

Yes, they are already on my apply list.
