Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FB2DFED2
	for <lists+nouveau@lfdr.de>; Mon, 21 Dec 2020 18:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BED6E49B;
	Mon, 21 Dec 2020 17:16:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054586E49B
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 17:16:13 +0000 (UTC)
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1krOn5-00031i-M1
 for nouveau@lists.freedesktop.org; Mon, 21 Dec 2020 17:16:11 +0000
Received: by mail-lf1-f70.google.com with SMTP id m67so11484438lfd.6
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 09:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Pz4SBTDx6BMkbLDQ5nrfRYm9x7WmPr6bGZI10+5Wso=;
 b=Nq5/2r+ONnIDbL0Ah7f6Dbr0gQDV5hKM9tZd1v9MbyfC8Xv0KBhLyhILtWewBKoN+T
 in8E9lIN7yFD8TAV2IDmz6uQHsXRgTh3gIVYC1t9lWSGTYQS6QPVmTY0CIZJI0qSig5l
 9zLuG9u3hjGhakf+0g6KV4uUQqefoKwkXrRlpkSquZDfuTCwtOvHDhYZeMQneUG7GjwE
 icSTGCTpeuCkwWdXAoLo0iiG4Dvu1qqzqoiGBdXlirmHOpE5r8JWLps8v63VspPN1mec
 wguk4ngH0AuHS1EwlFcgjRpz2Wh8cIuEqKzBFYg/j3WVGOlRVfxpPDUvt5xPU1MIRM/b
 /rTg==
X-Gm-Message-State: AOAM533aZRK9T4taM+zr9cyMjLDMbtocWPdyDMw0+9MAAzlkxp3gdkWW
 Q8fMHuXsusg/cPZp2UD32LACiFfXypg1/kfNqNx7NvG5lryWR3l5RkXfVql6t0S2jZ9tnX8zH4m
 SQGLlN0EsKQ4T+49EtF3tI9fOWx5uzB/speig6Eda5gzkrgbdhoztaHKiKmI=
X-Received: by 2002:a05:651c:118b:: with SMTP id
 w11mr1574953ljo.402.1608570971159; 
 Mon, 21 Dec 2020 09:16:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2YXycweLB9saylOYpQELQXyDWheqBfUKEeeBhg9fBTp5dxHBt0XV6PKI9T7tz8LDvPKU6uC6XcVCTDVBIws8=
X-Received: by 2002:a05:651c:118b:: with SMTP id
 w11mr1574936ljo.402.1608570970912; 
 Mon, 21 Dec 2020 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <s5hft3zf6mi.wl-tiwai@suse.de>
In-Reply-To: <s5hft3zf6mi.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 22 Dec 2020 01:15:59 +0800
Message-ID: <CAAd53p7TOBwee6dfY8uY=2P6wGJ9Uf551LVp95jLwz7SA9PWFA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
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
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jaroslav Kysela <perex@perex.cz>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 12:47 AM Takashi Iwai <tiwai@suse.de> wrote:
[snip]
> But what happens if you plug the HDMI cable later and want to use the
> HDMI audio?  It won't work with your fix, right?

No it won't.
It's possible to fix from nouveau, but it's at the mercy of Nvidia to
fix their proprietary driver, which many users use.

Kai-Heng

>
>
> Takashi
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
