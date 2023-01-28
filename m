Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4667F8D0
	for <lists+nouveau@lfdr.de>; Sat, 28 Jan 2023 15:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3E110E1DC;
	Sat, 28 Jan 2023 14:50:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4810E1DC
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 14:50:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id me3so20792825ejb.7
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3rtwfwcsvMx7LBqKbHu3dkZXfAdloErxVvHEqNHOUM=;
 b=ppro+f7OdBBvQxyg9YPldl4lMJdAzW6yHrDfEsKeU4h6mKbPj4XpMDrbXCSTF+ZQib
 q8nBwmcvpjrXv7TxLiEC7TeZPsQ0ozV19K3gJ6BHWIx+IUk3b5RYYzVRhFQf4l5/Fj2g
 L7+vrvKTvMCirtjrDtngGnnf8xHBOGeqDbF5qnwfj5p+ok7eHyzUdggOD9u/dxDnzixW
 RcbWmL7qI9E2x1whhyJ3Aeu3CPbIUr1RBZlOiQOVxKfDDlNFTtu0SFoU/x7NeLDUOe4J
 X7TsoTa67pVoPrch9BqcIHS4KNbhf0Es0IWmdJ5O9+IodRcyWdfax57Vi130++LgwBiE
 c/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V3rtwfwcsvMx7LBqKbHu3dkZXfAdloErxVvHEqNHOUM=;
 b=4hrzE33vDHyI6uXz6kd7E70Nf3FBkPy5EuEYi6uIEtwUWEdOZ5BnFjNSs9pUabnJQt
 C080TX5EvE9ET2IKGy6RIWvkNSoZjsLu8fmp7LVHkUgEFHe089opjCRMWzPC4NnKBnof
 F9BPW6nWyIFwKrEbY9exFzl+Y0kPsaoKkTDEKM4X5dD1rNwlY7OJVpnlXdkZG3W59brL
 IO3DKCRJEmgg+XrXqgXJkB4VcEQhxNYrzQL/mXgpapNnsf04jZb4LfS9ekc/giORbs6t
 8pZ8PclbxTYl99TAKGGEB6NScVIcKdXs6sfFaihrVNcqw5IH8nDNI5YbFmWlqbEkG0Yd
 d/PQ==
X-Gm-Message-State: AFqh2kr3COQw1+LyB2Qd/0fFG3djt/dwFOKPb3WukGNoTEj9NHfsiNtD
 xvMNEOVaHleaulttPG5UvME=
X-Google-Smtp-Source: AMrXdXvYbnbEoWKYeXOor31Nflfm6zNDUISm5bDoBPP5yeVXRQpfN0rRjxWJn3moFsjHifE79oH43A==
X-Received: by 2002:a17:906:1f57:b0:872:2cc4:6886 with SMTP id
 d23-20020a1709061f5700b008722cc46886mr38852811ejk.30.1674917401771; 
 Sat, 28 Jan 2023 06:50:01 -0800 (PST)
Received: from [192.168.178.20] (host-82-63-78-202.business.telecomitalia.it.
 [82.63.78.202]) by smtp.gmail.com with ESMTPSA id
 y14-20020a17090668ce00b0084d4733c428sm3906376ejr.88.2023.01.28.06.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 06:50:01 -0800 (PST)
Message-ID: <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
Date: Sat, 28 Jan 2023 15:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
To: stable@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
In-Reply-To: <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello,

The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fence in 
nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it was 
merged upstream.

The same patch [1] works with kernel 5.10.y, but it is not been merged 
upstream so far.

According to Karol Herbst suggestion [2], I'm sending this message to 
ask for merging it into 5.10 kernel.

Thanks in advance.

---
[1] 
https://lore.kernel.org/nouveau/20220819200928.401416-1-kherbst@redhat.com/

[2] 
https://lore.kernel.org/nouveau/CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com/
