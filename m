Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BB482EE32
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2C10E4A4;
	Tue, 16 Jan 2024 11:47:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069910E642
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 03:55:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SRQ2S0zBvz9scN;
 Fri, 10 Nov 2023 04:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1699588512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+mYWcVAli9GCc4vPf2eDB3X2wHHEc2PFC+6KilCNEcA=;
 b=qoHS2aXxsUcpqJPKJdC4SI2fQWD6CvHKZd8rgtalJQ45BHmCBDsStfHNnHSu8PLqXeZKPX
 3Wj+RmMzerw3iIO1vcSWmri07ckQ8LlA2IsEPbkkFSS4j4yyREWIxIyNfM5owqOUvmw8wJ
 ycE8DKReVnsEcY/xBRqXHcDXOhshiUQJ3TGfWyzO8ihjGhcDpqLspeX5r53oHdDnjuzj7T
 /kxYjemXrPEERerMX25HLj/Ck8uBBcRsq6f6cHz0vCCWsqVaHEcw/ZImjw+VKs1ENVMoAq
 ykVk2v699lp4qBjo/vfan+boUAgxQO/dtXDSjnYlq2jYjZ3UxYlckAVe2HMM9Q==
Message-ID: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
Date: Thu, 9 Nov 2023 21:55:01 -0600
MIME-Version: 1.0
Content-Language: en-US
To: stable@vger.kernel.org
From: "Owen T. Heisler" <writer@owenh.net>
Subject: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4SRQ2S0zBvz9scN
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

#regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
#regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218124

## Reproducing

1. Boot system to framebuffer console.
2. Run `systemctl suspend`. If undocked without secondary display, 
suspend fails. If docked with secondary display, suspend succeeds.
3. Resume from suspend if applicable.
4. System is now in a broken state.

## Testing

- culprit commit is 89c290ea758911e660878e26270e084d862c03b0
- v6.6 fails
- v6.6 with culprit commit reverted does not fail
- Compiled with 
<https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09d7be931e813/v6.6-config1>

## Hardware

- ThinkPad W530 2438-52U
- Dock with Nvidia-connected DVI ports
- Secondary display connected via DVI
- Nvidia Optimus GPU switching system

```console
$ lspci | grep -i vga
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core 
processor Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro 
K2000M] (rev a1)
```

## Decoded logs from v6.6

- System is not docked and fails to suspend: 
<https://gitlab.freedesktop.org/drm/nouveau/uploads/fb8fdf5a6bed1b1491d2544ab67fa257/undocked.log>
- System is docked and fails after resume: 
<https://gitlab.freedesktop.org/drm/nouveau/uploads/cb3d5ac55c01f663cd80fa000cd6a3b5/docked.log>
