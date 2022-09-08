Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E25B13CE
	for <lists+nouveau@lfdr.de>; Thu,  8 Sep 2022 07:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F075F10E947;
	Thu,  8 Sep 2022 05:08:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5882610E947
 for <nouveau@lists.freedesktop.org>; Thu,  8 Sep 2022 05:08:39 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MNRwg51p3z9sb6;
 Thu,  8 Sep 2022 07:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1662613715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpE5iAkno9n7ce+6W7OfmKJoaOls0ndgnZAuctOD+io=;
 b=plImTUCpsywHdIkHoeO1gTNUQOeu7NpEetxH8bkIje7Ofj3QebsEpsfKS73MyyhIgp3gnE
 7opkJfPpiHObo4RtQtiQzbMiTAJygKe0RhD+8J7pWVEDcRzmd75RBBL2TN85Pq1qM0rxEF
 XqX85UcCDbkB9GIIdEGu0Rb9mBq0ZOo7F6A9rx3UN7qpEDSC69zBObSvHk8ioUVXHnT0Jr
 kwI+pikFSf/mtr+48yPaB6KlWyf43ri3Afdb5UdD5Dm2Nr/j1L9eatu78u7rgiCGjqHCRZ
 PCEhUOVBDMzEQc6ljjYAlWXA1/nSl5H1ly/3EQ+TkA01bINa5r46nAYxAORCVw==
Message-ID: <967f752c-3508-1151-d245-44f83c372826@owenh.net>
Date: Thu, 8 Sep 2022 00:08:32 -0500
MIME-Version: 1.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
References: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
 <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
 <56ad0ca76d2942b8ab2ebe4f212b771d@di.ku.dk>
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <56ad0ca76d2942b8ab2ebe4f212b771d@di.ku.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4MNRwg51p3z9sb6
Subject: Re: [Nouveau] Patch to TroubleShooting.html
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

On 2022-09-01 02:38, Klaus Ebbe Grue wrote:
>> The edit buttons on the wiki link to the source repository on GitLab. I
>> asked about developer access on 2022-08-05 and never received a reply:
>> ...
>> I haven't tried asking on IRC (#nouveau on OFTC).
> 
> OK. Thanks for the warning. I will see if I have the energy to continue.

Hi Klaus,

You could open a new issue for the wiki (registration required) here:

https://gitlab.freedesktop.org/nouveau/wiki/-/issues/new

Or I can open an issue for you, using the body of your original message.

Thanks,
Owen
