Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6392BA2DA
	for <lists+nouveau@lfdr.de>; Fri, 20 Nov 2020 08:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89676E876;
	Fri, 20 Nov 2020 07:15:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7586E876
 for <nouveau@lists.freedesktop.org>; Fri, 20 Nov 2020 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1605856516;
 bh=+LEyJWZBHwIf02qa1cs+cqkQlhMdXc7yjscoAD4xi0o=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=QHrvF8X0JKxWIyhwpzUzUtKUN2toZ2pruLpm3yhtUF3HQ8trKRaCtivgolYNieVqq
 CWisIgjKojTA5q6PiNQ4ZprcR+LowOjHZFcsIpb1ADNSQQasZrb6/52l+ZUPOfB/bj
 tgrW8ExOYvGETzu7R8kl3cQW9Yz/u5yYMdnhu6qM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.217.24]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1kSW7W3iIz-00DV6H; Fri, 20
 Nov 2020 08:15:15 +0100
Message-ID: <eee10eb4ea028d4ac74939d5100ae9c4383b82da.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Fri, 20 Nov 2020 08:15:15 +0100
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:aiYOCE7yOonTQvzkaLZG/yT+pmhsOWuwq57JC+KrIrlKD2D3X6M
 g5PzUpc9DgM63193lyXhGyQpbd8b7QUU7rLuIBj2cc9ipqfa7QeTACXi6NmQNSl0FRYYUpU
 bu7rj5cF5yZU+W9qZ7+Q9KKp5oYtVhl9srujPx2481B4sZgcxjlDuHzETAusED2bab76/sr
 Z8BmTlGOZ0fr0ValuhwyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+VBCuNVCrXU=:/qZji59ny1UFpkeSBvoCMj
 tud57X9VVId1+a/2vPXth3p4Zl42+UskmnsHwfttqR2RfebGN6uSfRkpMxFm3ONTl+FxsNw1F
 Qu3leUNg+9r8JLnZm3E7gTJGHNEkpESquPwy6dbag8WB6Lfqzk8c1GmKzE8oeH6Bv80nsNt5l
 GCiQf3l1uwEU63GB55axtmJXTjog9OIr274Dk8cfGGukDC6xDTDS12qe/xStE9wwYf1zyqEqa
 Womnl6AeDuJaWVL3jmVfOamFHVrlQzZhBG96hs+WLQHwEP+04NMB6CsIlUYxc3LyrGAGO0f9G
 9k9KVpeJZ7qfmMS6/EFFXrghqa0QqvRxQemMR1Wub8DxN5wUPYI/Wz8fYJdPk7fuEm1FQ4wvr
 wVEQpmX88Bzfplp9ALSGR3G7jtU7IiGC+qAoFuFM8C9ZwIU8IY33vf/6a0y679xVoCXKyxgdR
 wEJszatyHXyTe47GjJu19ihoyB6z7KbLWujQpUH8k45nINDxNBvV0uKfGZT0LfjK0RRTox9Z/
 2SOoY1LWIeBWYjqwuv51TfcvLGOH2qkROl8DV2r9P9ebMYvMSurwu5HJz5mu025Uaa2XvLtH5
 PSFfI+nIokTl+i35QDRHaMF+Wt6fdsOZFfsRXJIq97BLDDOrVhlblMeCMUid5fUBrgjcnjdzY
 fj2KskYGhjg7qC6ZEcQiqPb3KgL83F+SacppjZa96XeG2OEnqcus3men25ZTN7t8BDVVn4JnC
 GiXftTvGtOyBM09KKYzaMFX0t5m8HTT9cXHg4hJDZALL3weIwPkG88U7FYAH/OWSdw6p+37il
 szQ7VsazrwhQOuyLLdI8V2AjzJyOGiTq9j3QdbvgXiGE35lLEhpP4AjanrVEXvIPntKSSZCsz
 BPme47ZdBZg01Q8eR38w==
Subject: [Nouveau] nouveau: WARNING: CPU: 0 PID: 20957 at
 drivers/gpu/drm/nouveau/nvif/vmm.c:71
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

[15561.391527] ------------[ cut here ]------------
[15561.391560] WARNING: CPU: 0 PID: 20957 at drivers/gpu/drm/nouveau/nvif/vmm.c:71 nvif_vmm_put+0x4a/0x50 [nouveau]
[15561.391562] Modules linked in: nls_utf8(E) isofs(E) fuse(E) msr(E) xt_comment(E) br_netfilter(E) xt_physdev(E) nfnetlink_cthelper(E) nfnetlink(E) ebtable_filter(E) ebtables(E) af_packet(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysfs(E) rfkill(E) xt_pkttype(E) xt_tcpudp(E) ip6t_REJECT(E) nf_reject_ipv6(E) ipt_REJECT(E) nf_reject_ipv4(E) iptable_filter(E) bpfilter(E) ip6table_mangle(E) ip_tables(E) xt_conntrack(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) libcrc32c(E) ip6table_filter(E) ip6_tables(E) x_tables(E) hid_logitech_hidpp(E) sr_mod(E) usblp(E) cdrom(E) hid_logitech_dj(E) joydev(E) intel_rapl_msr(E) intel_rapl_common(E) at24(E) mei_hdcp(E) iTCO_wdt(E) regmap_i2c(E) intel_pmc_bxt(E) iTCO_vendor_support(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) ledtrig_audio(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_intel(E) coretemp(E) snd_intel_dspcfg(E) kvm_intel(E) snd_hda_codec(E) snd_hwdep(E) snd_hda_core(E) kvm(E)
[15561.391586]  nls_iso8859_1(E) nls_cp437(E) snd_pcm(E) irqbypass(E) crct10dif_pclmul(E) snd_timer(E) crc32_pclmul(E) r8169(E) ghash_clmulni_intel(E) snd(E) aesni_intel(E) realtek(E) crypto_simd(E) i2c_i801(E) mei_me(E) mdio_devres(E) cryptd(E) pcspkr(E) soundcore(E) i2c_smbus(E) lpc_ich(E) glue_helper(E) mfd_core(E) libphy(E) mei(E) fan(E) thermal(E) intel_smartconnect(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E) grace(E) sch_fq_codel(E) sunrpc(E) nfs_ssc(E) uas(E) usb_storage(E) hid_generic(E) usbhid(E) nouveau(E) wmi(E) i2c_algo_bit(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) xhci_pci(E) cec(E) ahci(E) rc_core(E) ehci_pci(E) xhci_hcd(E) ttm(E) libahci(E) ehci_hcd(E) libata(E) drm(E) usbcore(E) video(E) button(E) sd_mod(E) t10_pi(E) vfat(E) fat(E) virtio_blk(E) virtio_mmio(E) virtio_ring(E) virtio(E) ext4(E) crc32c_intel(E) crc16(E) mbcache(E) jbd2(E) loop(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod
 (E)
[15561.391626]  efivarfs(E) autofs4(E)
[15561.391637] CPU: 0 PID: 20957 Comm: kworker/0:4 Kdump: loaded Tainted: G S          E     5.10.0.g9c87c9f-master #3
[15561.391640] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
[15561.391667] Workqueue: events nouveau_cli_work [nouveau]
[15561.391682] RIP: 0010:nvif_vmm_put+0x4a/0x50 [nouveau]
[15561.391684] Code: 00 00 00 48 89 e2 48 c7 04 24 00 00 00 00 48 89 44 24 08 e8 48 e7 ff ff 85 c0 75 0e 48 c7 43 08 00 00 00 00 48 83 c4 10 5b c3 <0f> 0b eb ee 66 90 0f 1f 44 00 00 53 48 83 ec 18 83 fe 01 48 8b 5c
[15561.391686] RSP: 0000:ffff8881feca7e08 EFLAGS: 00010282
[15561.391688] RAX: 00000000fffffffe RBX: ffff8881feca7e28 RCX: 0000000000000000
[15561.391690] RDX: 0000000000000010 RSI: ffff8881feca7d80 RDI: ffff8881feca7e18
[15561.391692] RBP: ffff8881feca7e50 R08: 0000000001dc5000 R09: 0000000000000000
[15561.391693] R10: ffffffff82003de8 R11: fefefefefefefeff R12: dead000000000122
[15561.391695] R13: dead000000000100 R14: ffff888102fa9328 R15: ffff888102fa9308
[15561.391697] FS:  0000000000000000(0000) GS:ffff88841ec00000(0000) knlGS:0000000000000000
[15561.391698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15561.391700] CR2: 00007fd692058000 CR3: 0000000003c10002 CR4: 00000000001706f0
[15561.391701] Call Trace:
[15561.391729]  nouveau_vma_del+0x58/0xa0 [nouveau]
[15561.391755]  nouveau_gem_object_delete_work+0x26/0x40 [nouveau]
[15561.391782]  nouveau_cli_work+0x76/0x120 [nouveau]
[15561.391786]  ? __schedule+0x35c/0x770
[15561.391790]  process_one_work+0x1f5/0x3c0
[15561.391792]  ? process_one_work+0x3c0/0x3c0
[15561.391794]  worker_thread+0x2d/0x3d0
[15561.391796]  ? process_one_work+0x3c0/0x3c0
[15561.391798]  kthread+0x117/0x130
[15561.391800]  ? kthread_park+0x90/0x90
[15561.391803]  ret_from_fork+0x1f/0x30
[15561.391806] ---[ end trace 1f8ba448e97e64e0 ]---

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
