Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593B197588
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE4E6E0EF;
	Mon, 30 Mar 2020 07:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B83E6E220
 for <nouveau@lists.freedesktop.org>; Sun, 15 Mar 2020 20:58:25 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id m25so1083870vsa.7
 for <nouveau@lists.freedesktop.org>; Sun, 15 Mar 2020 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DLFE/X2AmhLaAiDrktfuP3w2Q7Hnf3ON+G95Jwmi4bo=;
 b=LQqBblzFgxDHiKpsRCudXerwb5ZZHedzPDYe1xu7wNZ9k6nAhxFx8GpEzTmxiwThto
 BKaAIODCo5ogVGjPG/gDMxLGj0G3MWmpPnaRags9bHu9xuhcmo9YwD1OzhYUrX5dRe5N
 iG4wt0lRIaaQ9DNeDgIPALGY0MbKZU2xnxHZQMIVwhNaSAgoGHZEhP4xIeNouR8q7+NO
 0pAspSJyu8mdjW/SQ7J2Hy5tjfqg6yWE8x2J0lEWFs2rgG22ukZz6HWKk/3deABaRlmO
 5O/KSAQ4jgr2oPn4TNOqNLDHu3ayjyoL8irOmd0U6ofzevVYucTGmb+pAikh4M7XqCkb
 WPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DLFE/X2AmhLaAiDrktfuP3w2Q7Hnf3ON+G95Jwmi4bo=;
 b=ZGtMTSR22BiwE26txLYOEj8lJKtXcWerNf96YQE/ub548dgCPf6Cw1Q6KR3zSxoP56
 pl7DOFCXcnBMw1Jaun0WimQeMOb3krL6S/GvJdrC1pgC2yDR1B4tiwwufTAV4F8Chaxh
 zJcaph/cPCfghBh7Tp97EYnilILl/JhQiAErDerTXB+PG0z/21k54VEKKigli0PltXXL
 djser8pjt7zqUdYuN5WET2ZMt40ScvQHvY7kCkSJ6tvXSPhhb5Vb3WLQISQlfym8ZbQE
 gX5lbFdxyP2Pe9CpMolCNZsCGvNuhE06wRGaZNjhMnQgxB8hW4hqO1+Vaiw/WrdvfVmS
 Qymg==
X-Gm-Message-State: ANhLgQ1ZFPLzjAb5oCDUgOU9kq+ePOTkahxEm3XuIVIji5SbzlW4ekmj
 fwiEYaFZHLD9M0sLHKjUeLJNWl5Jl6q8TD+gtjVhnNR8
X-Google-Smtp-Source: ADFU+vuKWVi2bA2ukdBGnfGOWtfbIAF5rPuY389Z8VDNgSudgCqo4JZWKOpNDvi3QNxTtUrSGE+zIjS4TNSi4VHL1CM=
X-Received: by 2002:a67:fb11:: with SMTP id d17mr2252615vsr.161.1584305904614; 
 Sun, 15 Mar 2020 13:58:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Jes=C3=BAs_J=2E_Guerrero_Botella?=
 <jesus.guerrero.botella@gmail.com>
Date: Sun, 15 Mar 2020 21:58:13 +0100
Message-ID: <CAMix8LH00FU9VmT1uGXhTN+PiCM+i8J1uk=Ps-Fdy9jXmN3TVQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: [Nouveau] Status of GF108GLM [NVS 5200M]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGVsbG8uCgpJIGFtIG5vdCBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0LCBzbywgcGxlYXNlLCBpZiBJ
IGRvIGFueXRoaW5nIHdyb25nCmp1c3QgbGV0IG1lIGtub3cgcG9saXRlbHkgYW5kIEknbGwgdHJ5
IHRvIGltcHJvdmUgOikKCkkganVzdCB3YW50IHRvIGtub3cgaWYgdGhlcmUncyBhbnkgYnJhbmNo
IG9mIG5vdXZlYXUgdmVyc2lvbiB0aGF0IHdpbGwKd29yayB3aXRoIHRoaXMgY2hpcC4gbHNwY2kg
bGlzdHMgaXQgYXM6CgowMTowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJQSBD
b3Jwb3JhdGlvbiBHRjEwOEdMTSBbTlZTCjUyMDBNXSAocmV2IGExKQoKSSB0aGluayBpdCdzIEZl
cm1pLCBidXQgSSBhbSBub3Qgc3VyZS4gV2hlbiBJIHRyeSB0byBjaGFuZ2UgcHN0YXRlIGl0IHNh
eXM6CgojIExDX0FMTD1DIGVjaG8gJzBmJyA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS8xL3BzdGF0
ZQpiYXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogRnVuY3Rpb24gbm90IGltcGxlbWVudGVkCiMgTENf
QUxMPUMgY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8xL3BzdGF0ZQowMzogY29yZSA1MCBNSHog
bWVtb3J5IDEzNSBNSHoKMDc6IGNvcmUgMjAyIE1IeiBtZW1vcnkgMzI0IE1IegowZjogY29yZSA2
NzIgTUh6IG1lbW9yeSAxNTY5IE1IegpBQzogY29yZSAwIE1IeiBtZW1vcnkgMCBNSHoKCkl0J3Mg
d29ydGggbm90aW5nIHRoYXQncyBhIHNlY29uZGFyeSBncHUuIEkganVzdCB1c2UgdGhlIGludGVs
IGNoaXAKZm9yIGV2ZXJ5ZGF5J3Mgd29yaywgYnV0IEkgaGF2ZSBzb21lIGZyZWUgZGF5cyBhbmQg
SSBhbSB0cnlpbmcgdG8gZ2V0CnRoZSBzZWNvbmRhcnkgb25lIHdvcmtpbmcgYW5kIHB1dCBpdCB0
byBnb29kIHVzZSwgaWYgcG9zc2libGUuCgpUaGFua3MgZm9yIGFueSBoZWxwIHlvdSBjYW4gcHJv
dmlkZS4gUGxlYXNlLCBDQyBtZSwgYXMgc2FpZCwgSSBhbSBub3QKc3Vic2NyaWJlZCB0byB0aGUg
bGlzdCBldmVuIHRob3VnaCBJJ2xsIHRyeSB0byBrZWVwIGFuIGV5ZSBvbiB0aGlzLgoKCi0tIApK
ZXPDunMgR3VlcnJlcm8gQm90ZWxsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
