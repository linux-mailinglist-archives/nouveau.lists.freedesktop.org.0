Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581077F373A
	for <lists+nouveau@lfdr.de>; Tue, 21 Nov 2023 21:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266510E539;
	Tue, 21 Nov 2023 20:24:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D8710E59D
 for <nouveau@lists.freedesktop.org>; Tue, 21 Nov 2023 20:24:01 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SZbSC6VPLz9srX;
 Tue, 21 Nov 2023 21:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1700598235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rR3OoAj67pn5n8eC6jWnNK3ENrbMOlGxtnXJr8qwgwA=;
 b=emxrJ952MQl+TffV29mZT1PCKncsS6Pi8B1o1lZrkBx99YDqpLW+GrIThDoNJwpHPT9Dq6
 gDki+IEskEc0k6vGK3JZRrQIVJa4cKSelGwZ4Qi0yAROpcfBkkdwylp8YireWHyptqSPNp
 imRK8H6mEGCboJQ641Pv6j6ZjYd011lRtPfsK8eX1NemGNpqh87dM80IUCG6UEzAAJRBnk
 57+OPgrD8pw+N12Zg0F8C1bwIR8yrP2ayE/UicQ+t1uVRdfADNqLRItvUwckjzjqAUHY72
 CgJ/pXJ0grH5bigaUmE82gdqeU7VsGX28zbPu4hbUxFFvN6+Wb5CSfcqHsVLHg==
Message-ID: <9bce5d00-8db6-4c8b-9817-06502492b44a@owenh.net>
Date: Tue, 21 Nov 2023 14:23:42 -0600
MIME-Version: 1.0
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
 <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
 <6b7a71b4-c8a2-46f4-a995-0c63e7745ca3@owenh.net>
 <c72ca99e-8657-4ed8-9999-5702ebeb5b8c@leemhuis.info>
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <c72ca99e-8657-4ed8-9999-5702ebeb5b8c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SZbSC6VPLz9srX
Subject: Re: [Nouveau] [REGRESSION]: nouveau: Asynchronous wait on fence
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/21/23 09:16, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 15.11.23 07:19, Owen T. Heisler wrote:
>> On 10/31/23 04:18, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 28.10.23 04:46, Owen T. Heisler wrote:
>>>> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
>>>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
>>>>
>>>> ## Problem
>>>>
>>>> 1. Connect external display to DVI port on dock and run X with both
>>>>      displays in use.
>>>> 2. Wait hours or days.
>>>> 3. Suddenly the secondary Nvidia-connected display turns off and X stops
>>>>      responding to keyboard/mouse input. In *some* cases it is
>>>> possible to
>>>>      switch to a virtual TTY with Ctrl+Alt+Fn and log in there.

>> Here is a decoded kernel log from an
>> untainted kernel:
>>
>> https://gitlab.freedesktop.org/drm/nouveau/uploads/c120faf09da46f9c74006df9f1d14442/async-wait-on-fence-180.log

> Maybe one of the nouveau developer can take a quick look at
> d386a4b54607cf and suggest a simple way to revert it in latest mainline.
> Maybe just removing the main chunk of code that is added is all that it
> takes.

I was able to resolve the revert conflict; it was indeed trivial though 
I did not realize it initially. I am currently testing v6.6 with the 
culprit commit reverted. I need to test for at least a full week (ending 
11-23) before I can assume it fixes the problem.

After that I can try the latest v6.7-rc as you suggested.

I have updated the bug description at
<https://gitlab.freedesktop.org/drm/nouveau/-/issues/180>.

Thanks again,
Owen

--
Owen T. Heisler
<https://owenh.net>
