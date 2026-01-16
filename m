Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A75D386BC
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:11:38 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 681FD10E1D4;
	Fri, 16 Jan 2026 20:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YVb3q8qe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4970144C5E;
	Fri, 16 Jan 2026 20:03:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768593780;
 b=b4V0iPeLSCRUoKa0WdyG/0NZ1Z60ZaZT7Htekm63ZtAP8OAuwZJyAwz1r4bFxsHqCWFUc
 gBXtwgboDa0DORxZxkSOWNOVk5Ayg/CTmTyoCgbZvR48HjBbq6jPgeyp772Q07cJ9POPQTD
 mh56iMORJn+SF4NY7z7otIFx/nhTlqQaT0YW0Y3t6nJFbOYClxZSWuAZ8YZkbcUIUCDRtri
 kvjds57Q/siXJUmeKukNbuh031yefLYG9bDBR9l/02TwtwLM/TQX2AmqJgUcUhBs+GjLo3D
 YqlIDElfdJYG1Bj+DrOOVJFYWbctCkiQeTZTYW5XwxPwCxBpSBnVADWWsggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768593780; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SUGJU/z9xULWbGAdqlZ93K48XB2RdAsxKTdlzA3uZSE=;
 b=JV7pKiXCFNZXDYWdDOz6bf5nAK2k1p8PyQ8bOeQwI7VzneT5PH0CY+5wYn74WQNcY3sbr
 0XUAJte2nqwqHQkJlA8WOqzcWbNaGV0tWw+hUco2wbep0Cqxex1OvvJac0YuOB5c4OVH6iQ
 nbUvyQkjK35D7s5nTCkLgQOWtKhBgcK7P4qB0m9Eq2eLCXDwlhg/+lglBt0U7QIu0TxZZiW
 +NyqEANlFsj7X+RetYMOL5ElonDaao6n7LLcR8TaR3/dQNqmmj8h+WKIBcuMKN3DAsSH7TF
 vG4JJD8SYN6tl+H4wjssxNFegkQ4FHB8/BshegtZHxDa24msmuBM+OcSzomQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 94C8640744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:02:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81A4B10E03A
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:11:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B2D54322E;
	Fri, 16 Jan 2026 20:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D48C116C6;
	Fri, 16 Jan 2026 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594292;
	bh=SUGJU/z9xULWbGAdqlZ93K48XB2RdAsxKTdlzA3uZSE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YVb3q8qejxwAKN0Lj2SZ0IE+Z4cSDOIsX5zctf+KDBByy0jAgbKWamXIoAeprr6sT
	 4SOAjkjtEspr4W/LZ6rp7dzl6FbFdNTHXDcMjSggiTcUIkLFl0h/CM06j84zY+/3j/
	 jSf4yCXr1b1EZdOF8b6UQ8dUjLz5/BQiGy6InNEn/Tzb2wmo6/wHwpcl5PL252dk1J
	 7Z58fhbscUITdFlpmNVakEzAyPfoZaywQZs4PWB3mEZrp/N90Q09VyNfT8NsKGtd7h
	 cqR2ZWYNXmlpCIDPCZCSRZnH/7ZObe7DoTBqChYt8++qZZgO6PNi84qmNtOXQmmMRQ
	 uCiyvRUrETL4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:11:29 +0100
Message-Id: <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
In-Reply-To: <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
Message-ID-Hash: JQ22TILZAHG4S6AZ2IP2ZBZ44Q6LNH73
X-Message-ID-Hash: JQ22TILZAHG4S6AZ2IP2ZBZ44Q6LNH73
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JQ22TILZAHG4S6AZ2IP2ZBZ44Q6LNH73/>
Archived-At: 
 <https://lore.freedesktop.org/DFQACNZ42CNK.27BOZPAO1T33R@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 9:08 PM CET, John Hubbard wrote:
> On newer GPU architectures, we don't even *do* a falcon reset, fwiw. For
> example, on Blackwell, the GPU's FSP reboots the GSP by itself. And we
> don't do an FSP reset. So we are all out of the falcon reset business
> there. :)

Great, then let's add the reset() function. :)
