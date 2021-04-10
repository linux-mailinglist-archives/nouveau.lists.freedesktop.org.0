Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC935B07D
	for <lists+nouveau@lfdr.de>; Sat, 10 Apr 2021 22:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E7D6EC56;
	Sat, 10 Apr 2021 20:48:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1361C6EC56
 for <nouveau@lists.freedesktop.org>; Sat, 10 Apr 2021 20:48:20 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 03CC4F20011;
 Sat, 10 Apr 2021 21:48:15 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 03CC4F20011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1618087696;
 bh=G/KMHNxJ10tQbDe69nA++juz4fZynQZtQ/TmQnU8gZU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rtcv1a0XHMirOX80HxcGaWbLsoJRj6qdJd3vWIhMsW3jREz5OLGRbkylBUe31GukR
 KfHjxMcHhGdDpL4mBMubQ+bys/OMe0DzF4R6g6BgrfpZktq2tA/AFgr1s8EkUvOXgO
 11vjcgkRFBdspV765d/qjjBXIc5u//qW2yTaT+yI=
To: Lukas Wunner <lukas@wunner.de>
References: <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
 <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
 <d01e375f-bf16-a005-ec66-0910956cc616@spliet.org>
 <20210410192314.GB16240@wunner.de>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <bddba2ca-15d5-7fd3-5b64-f4ba7e179ec0@spliet.org>
Date: Sat, 10 Apr 2021 21:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210410192314.GB16240@wunner.de>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.103.2 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
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
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jaroslav Kysela <perex@perex.cz>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Op 10-04-2021 om 20:23 schreef Lukas Wunner:
> On Sat, Apr 10, 2021 at 04:51:27PM +0100, Roy Spliet wrote:
>> Can I ask someone with more
>> technical knowledge of snd_hda_intel and vgaswitcheroo to brainstorm about
>> the possible challenges of nouveau taking matters into its own hand rather
>> than keeping this PCI quirk around?
> 
> It sounds to me like the HDA is not powered if no cable is plugged in.
> What is reponsible then for powering it up or down, firmware code on
> the GPU or in the host's BIOS?

Sometimes the BIOS, but definitely unconditionally the PCI quirk code: 
https://github.com/torvalds/linux/blob/master/drivers/pci/quirks.c#L5289

(CC Aaron Plattner)

> 
> Ideally, we should try to find out how to control HDA power from the
> operating system rather than trying to cooperate with whatever firmware
> is doing.  If we have that capability, the OS should power the HDA up
> and down as it sees fit.
> 
> Thanks,
> 
> Lukas
> 

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
