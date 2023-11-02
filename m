Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342D82EE6E
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E6310E4E9;
	Tue, 16 Jan 2024 11:48:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Thu, 02 Nov 2023 04:17:43 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5293710E7F6
 for <nouveau@lists.freedesktop.org>; Thu,  2 Nov 2023 04:17:43 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SLVmk1wmwz9sjT;
 Thu,  2 Nov 2023 05:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1698898278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WN5fmOdVvci8BiTSNTkQ11/6+0Vp0IU6VwTOPcaqcaQ=;
 b=rrGbY2xW1+rXEaQIHig+TA8Z9R5mZ/w4e0xwsXUEFojPDzbZ7sKhEhVYzH4xpRTZ5H2X48
 T6h7IdM00xkClDJDZ/H+03qZJouT0nZsDaEAW5h08dbXKz0qnv3dn1IOlacW3CzfbIAUgM
 LJ4GU4G9hQo5ihfIGvHxYZ5B6uoH9TC+FDTgO1EEEH4qSyrbMwEUHZcTmH9wHyohUhP95Z
 raj36ltUy+sBcX7xMgoch2fn5ihKDCD3yIqZbMLXYVTjaKmo1NHanvnKxElj34B6U+pWEK
 crFALFWXUoXJLH9eTsYjEYg5zzQL86vvSp5iZwQdxyRh50wzB+3D2JdeD5zjHw==
Message-ID: <f98d5544-34f8-4b35-9466-80fa9671686d@owenh.net>
Date: Wed, 1 Nov 2023 23:11:08 -0500
MIME-Version: 1.0
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
 <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/31/23 04:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> Thanks for your report. With a bit of luck someone will look into this,
> But I doubt it, as this report has some aspects why it might be ignored.
> Mainly: (a) the report was about a stable/longterm kernel and (b)it's
> afaics unclear if the problem even happens with the latest mainline
> kernel.

> You thus might want to check if the problem occurs with 6.6 -- and
> ideally also check if reverting the culprit there fixes things for you.

Thorsten,

Thank you for your reply and suggestions. I will try (a) testing on 
mainline (when I tried before I was interrupted by another, unrelated 
regression) and (b) reverting the culprit commit there if I am able to 
reproduce the problem.

Thanks,
Owen

--
Owen T. Heisler
https://owenh.net
