Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0F204CBB
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 10:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C856E936;
	Tue, 23 Jun 2020 08:42:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C5E6E936
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 08:42:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id rk21so4392257ejb.2
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 01:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PWxrTuC+CDhEhzCL5ILpu0EG463OVFcwsp6DdQyqwzw=;
 b=W4cOdFo7/GUnRBEga25TUO81VJJsm7bF3J6Xeu5GWBl9diNlhqP9UlAAVkzw5F/LC9
 l/9s7faBaAT22Px2Kyr/Mog5z4RHIf1oMUoTbxZQuHgKH8gLWSDrBmAz8fbUlbZqa3p9
 oLyfaOxYjm8EZ3WFyws3wSzsX5HxY9ycHgHOXtmuSKRp8o/gB43aw0M8X+XEmDiGWdBK
 qDBhKULc3ngUuApozwC/zTQRExWsgbo1fl2w+vEL2RI/IPCmhIONVJBA4ud6Fk7TmkQc
 h+qm/MGM/MTcU40INg0Rs11T2tAoaWcm9nQxqwY1XVJy87xAkaKNE/BR+pEZQlrx9fy/
 dePg==
X-Gm-Message-State: AOAM531y7IF609sFRfI5VHSEZd1XbEJLIoTXOi5vBK9LeF73kQMQSqP2
 gEIzdK6JoWDo1dvwurLpJZ8QRwR4900XDmW9YH1mWJ7P
X-Google-Smtp-Source: ABdhPJyLkmlU8tGI7OEyfdLhOT/6DvMXpz44sRIpwb44ckMUWy9DLvjSibw9UnlCrOa4DhtsfnfgrTXttfewR+s+JAM=
X-Received: by 2002:a17:907:42cb:: with SMTP id
 nz19mr14439604ejb.447.1592901749586; 
 Tue, 23 Jun 2020 01:42:29 -0700 (PDT)
MIME-Version: 1.0
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 23 Jun 2020 10:42:18 +0200
Message-ID: <CA+7wUswEqHJmmLx+bD4qeLnOEWdhxAK2mt-OXL37-e9NKCuBmQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] Remove debug info from nouveau driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi there,

I am gettings tons of messages in dmesg output such as:

[...]
[ 2419.238990] [drm:drm_mode_addfb2 [drm]] [FB:65]
[ 2419.243388] 00a0 2 base507c_ntfy_set
[ 2419.243391] 00000060
[ 2419.243391] f0000000
[ 2419.243393] 0084 1 base827c_image_set
[ 2419.243394] 00000010
[ 2419.243395] 00c0 1 base827c_image_set
[ 2419.243395] fb00007a
[ 2419.243396] 0110 2 base827c_image_set
[ 2419.243397] 00000000
[ 2419.243398] 00000000
[ 2419.243399] 0800 5 base827c_image_set
[ 2419.243399] 0007ce00
[ 2419.243400] 00000000
[ 2419.243400] 04380780
[ 2419.243401] 00007804
[ 2419.243402] 0000cf00
[ 2419.243408] 0080 1 base507c_update
[ 2419.243409] 00000000
[...]

Does anyone know how to remove those extra debug info from nouveau driver ?

For reference:

# cat /sys/module/nouveau/parameters/debug
(null)

Thanks much
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
