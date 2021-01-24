Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DEC301918
	for <lists+nouveau@lfdr.de>; Sun, 24 Jan 2021 01:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760F6E239;
	Sun, 24 Jan 2021 00:53:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Sun, 24 Jan 2021 00:53:03 UTC
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 472006E239
 for <nouveau@lists.freedesktop.org>; Sun, 24 Jan 2021 00:53:03 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 954746003C;
 Sun, 24 Jan 2021 00:43:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 954746003C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1611449000;
 bh=YNMayHq1mBSUT4igqc6MIeyqoCSp0lXGuYLXIrhDEFE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=pyO7+tjCy8aSfdS7K7OiUU4ufhfOnAMiUlgKTIllN0TNF7TkVuHFd69R6pDW/ej33
 KnYF9JSX7ssIVSP/f7ute+NfS7gG6WPehO2ZCuu5p3wyl9PuN6DeipmDhrEd604KvH
 SIyIOz6NAZSSuNohP3OUfxWnX5676axmckjiXgyM=
To: nouveau@lists.freedesktop.org, o1bigtenor <o1bigtenor@gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
 <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
 <CAKb7UvhFtXT7Kt6UCAZ7tCm2=kssTfCLRqUm+ajXiPo0Vn1Ksw@mail.gmail.com>
 <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q@mail.gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <6746024b-ab68-4d6f-626f-224800832eb6@spliet.org>
Date: Sun, 24 Jan 2021 00:43:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.103.0 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] Request for help in adding a HDMI output
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Op 23-01-2021 om 23:18 schreef o1bigtenor:
>>>>>>
>>>>>> OK, so this is your 4k monitor. It is plugged into the *secondary*
>>>>>> GPU, and does not report any 4k@60 modes in the EDID (well, it does
>>>>>> report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
>>>>>> this time). Whether that's because the monitor itself doesn't support
>>>>>> HDMI 2.0, or you plugged it into your old GPU which does not support
>>>>>> HDMI 2.0, I couldn't say from just this output. What I can say is that
>>>>>> no amount of modelines will get you 4k@60 in this setup with nouveau.
>>>>>
[...]
> If you would point out a suggestion that I haven't tried - - - please?

A quick DuckDuckGo for "Hisense 4K 60Hz only reports 30Hz" gives this 
thread: https://www.coolcomputing.com/article.php?sid=4659 . No idea 
whether this also applies to your 2016 model. Have you scavenged through 
the TVs menu's to make sure HDMI 2.0 is explicitly enabled?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
